import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_dialog_content.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/chatbot/core/update_faq_request/update_faq_request.dart';
import 'package:maze_app/feature/chatbot/core/util/create_faq_request/create_faq_request.dart';
import 'package:maze_app/feature/chatbot/presentation/view/faq/presentation/bloc/faq_bloc.dart';


class CrudFaqDialogContent extends StatefulWidget implements AutoRouteWrapper {
  final String? id;
  const CrudFaqDialogContent({super.key, this.id});

  @override
  State<CrudFaqDialogContent> createState() => _CrudFaqDialogContentState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<FaqBloc>(), child: this);
  }
}

class _CrudFaqDialogContentState extends State<CrudFaqDialogContent> {

  final _questionFocusNode = FocusNode();
  final TextEditingController _questionController = TextEditingController();
  final _answerFocusNode = FocusNode();
  final TextEditingController _answerController = TextEditingController();
  late final ValueNotifier<bool> _keyboardVisibilityValueNotifier;


  @override
  void initState() {
    super.initState();
    if(widget.id!=null && widget.id!.isNotEmpty) {
      context.read<FaqBloc>().add(FaqEvent.getFaqEvent(id: widget.id!));
    }
    _keyboardVisibilityValueNotifier = ValueNotifier(false);
  }

  @override
  Widget build(BuildContext context) {

    double h = MediaQuery
        .of(context)
        .size
        .height;
    _keyboardVisibilityValueNotifier.value = MediaQuery
        .of(context)
        .viewInsets
        .bottom != 0;

    return CustomDialogContent(
      header: '',
      dialogHeightPercent: 0.92,
      closeIcon: appAssets.arrowLeft.svg(),
      child: BlocConsumer<FaqBloc, FaqState>(
        listener: (context, state) async {
          if (state.faqStatus.isSuccess) {
            _questionController.text=state.faqResult!.question!;
            _answerController.text=state.faqResult!.answer!;

          } else if (state.faqStatus.isFailure) {
            Fluttertoast.showToast(
                msg: state.errorMessage!,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (state.faqStatus.isCrudSuccess) {
            Fluttertoast.showToast(
                msg: (widget.id!=null && widget.id!.isNotEmpty)
                    ?appStrings.faqUpdatedMsg
                    :appStrings.faqCreatedMsg,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
            await Future.delayed(const Duration(seconds: 1));
            Navigator.of(context).pop();

          } else if (state.faqStatus.isCrudFailure) {
            Fluttertoast.showToast(
                msg: state.errorMessage!,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText( (widget.id!=null && widget.id!.isNotEmpty)
                        ?appStrings.updateFaq
                    :appStrings.newFaq,
                        style: context.titleTitle1),
                    SizedBox(
                        height: (!_keyboardVisibilityValueNotifier.value)
                            ? 24
                            : 8),
                    CustomTextField.outline(
                      textEditingController: _questionController,
                      label: appStrings.question,
                      focusNode: _questionFocusNode,
                      maxLines: 2,
                      readOnly: false,
                      labelTextColor: context
                          .scheme()
                          .secondaryText,
                    ),
                    SizedBox(
                        height: (!_keyboardVisibilityValueNotifier.value)
                            ? 16
                            : 8),
                    CustomTextField.outline(
                      label: appStrings.answer,
                      textEditingController: _answerController,
                      maxLines: 5,
                      focusNode: _answerFocusNode,
                    ),
                    SizedBox(
                      height: (!_keyboardVisibilityValueNotifier.value)
                          ? h * 0.25
                          : h * 0.01,),
                    _buildCrudFaqButton(state)
                  ],),
              )
            ],
          );
        },
      ),
    );
  }

  Padding _buildCrudFaqButton(FaqState state) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: CustomButton.submit(
        text: (widget.id!=null && widget.id!.isNotEmpty)
            ?appStrings.updateFaq
        :appStrings.createFaq,
        showLoading: state.faqStatus.isLoading,
        onPressed: () {
          if(widget.id!=null && widget.id!.isNotEmpty) {
            UpdateFaqRequest request = UpdateFaqRequest(
              id: widget.id,
                question: _questionController.text.trim(),
                answer: _answerController.text.trim());
            context.read<FaqBloc>().add(
                FaqEvent.updateFaqEvent(
                    request: request));

          }else
            {
              CreateFaqRequest request = CreateFaqRequest(
                  question: _questionController.text.trim(),
                  answer: _answerController.text.trim());
              context.read<FaqBloc>().add(
                  FaqEvent.createFaqEvent(
                      request: request));
            }
        },
      ),
    );
  }
}
