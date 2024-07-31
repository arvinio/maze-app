import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/profile/presentation/view/report/data/model/report_request.dart';
import 'package:maze_app/feature/profile/presentation/view/report/presentation/bloc/report_bloc.dart';

@RoutePage()
class ReportPage extends StatefulWidget implements AutoRouteWrapper{
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<ReportBloc>(), child: this);
  }
}

class _ReportPageState extends State<ReportPage> {
  final _subjFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _subjController = TextEditingController();
  XFile? _file;
  final List<XFile> _files=[];
  final List<File>? _photos=[];
  Uint8List? _image;
  final List<Uint8List> _images=[];
  late final ValueNotifier<bool> _keyboardVisibilityValueNotifier;

  Future<void> selectImage() async {
    _file = await pickImage(ImageSource.gallery);
    if(_file!=null)
    {
      _image = await _file!.readAsBytes();
      _images.add(_image!);
    }
  }

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityValueNotifier = ValueNotifier(false);
  }

  @override
  void dispose() {
    _subjFocusNode.unfocus();
    _descFocusNode.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    ValueNotifier<bool> obscureState = ValueNotifier(_files.isNotEmpty);
    ValueNotifier<bool> obscureStateTextField = ValueNotifier(false);

    _keyboardVisibilityValueNotifier.value = MediaQuery
        .of(context)
        .viewInsets
        .bottom != 0;

    disableSubmitReport(obscureStateTextField);


    return BlocConsumer<ReportBloc, ReportState>(
      listener: (context, state) {
        if (state.reportStatus.isSuccess) {
          Fluttertoast.showToast(msg: appStrings.reportSendMsg,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }

        else if (state.reportStatus.isFailure) {
          Fluttertoast.showToast(msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return BasePageWidget(
            appBar: Padding(
              padding: const EdgeInsets.fromLTRB(16, 56, 12, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },

                      child: appAssets.arrowLeft.svg(width: 24, height: 24)),
                  SizedBox(width: w * 0.25,),
                  CustomText(
                    appStrings.reportProblem, style: context.titleHeadline,
                    textAlign: TextAlign.center,),
                ],
              ),
            ),
            child:
            SingleChildScrollView(
              child: SizedBox(
                height: (!_keyboardVisibilityValueNotifier.value)
                    ? h * 0.9
                    : h * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: (!_keyboardVisibilityValueNotifier.value)
                        ? 30
                        : 10),

                    CustomTextField.outline(label: appStrings.subject,
                      textEditingController: _subjController,
                      focusNode: _subjFocusNode,
                        onChanged: (value){
                          disableSubmitReport(obscureStateTextField);
                        },
                      onEditingComplete: () {
                       disableSubmitReport(obscureStateTextField);
                      }
                    ),
                    SizedBox(height: (!_keyboardVisibilityValueNotifier.value)
                        ? 20
                        : 10),
                    CustomTextField.outline(label: appStrings.description,
                      textEditingController: _descController,
                      maxLines: 5,
                      focusNode: _descFocusNode,
                        onChanged: (value){
                          disableSubmitReport(obscureStateTextField);
                        },
                        onEditingComplete: () async{
                        disableSubmitReport(obscureStateTextField);

                      }
                    ),
                    SizedBox(height: (!_keyboardVisibilityValueNotifier.value)
                        ? 20
                        : 10),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await selectImage();

                        obscureState.value = !obscureState.value;
                      },
                      child: Container(
                          padding: EdgeInsets.all(
                              (!_keyboardVisibilityValueNotifier.value)
                                  ? 30
                                  : 10),
                          width: (!_keyboardVisibilityValueNotifier.value) ? w /
                              4 : w / 6,
                          height: (!_keyboardVisibilityValueNotifier.value)
                              ? 100
                              : 50,
                          decoration: BoxDecoration(
                            color: context
                                .scheme()
                                .neutralsBackground,
                            border: Border.all(color: context
                                .scheme()
                                .neutralsBorderDivider),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(Dimen.defaultRadius)),
                          ),
                          child: appAssets.addReport.svg()
                      ),
                    ),
                    SizedBox(height: (!_keyboardVisibilityValueNotifier.value)
                        ? 15
                        : 5,),
                    SizedBox(
                      height: (!_keyboardVisibilityValueNotifier.value)
                          ? h / 4
                          : h / 9,
                      child: ValueListenableBuilder(
                        valueListenable: obscureState,
                        builder: (BuildContext context, bool obscureValue,
                            Widget? child) {
                          return GridView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                // number of items in each row
                                mainAxisSpacing: 10,
                                // spacing between rows
                                crossAxisSpacing: 10,
                                // spacing between columns
                                mainAxisExtent: 100,
                              ),
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              itemCount: _files.length,
                              itemBuilder: (context, index) =>
                                  Container(
                                    padding: const EdgeInsets.all(30),
                                    width: w / 4, height: 100,
                                    decoration: BoxDecoration(
                                        color: context
                                            .scheme()
                                            .neutralsBackground,
                                        border: Border.all(color: context
                                            .scheme()
                                            .neutralsBorderDivider),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(Dimen.defaultRadius),
                                        ),
                                        image: DecorationImage(
                                            image: MemoryImage(
                                                _images[index]))
                                    ),));
                        },
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable: obscureStateTextField,
                        builder: (BuildContext context, bool obscureValue,
                            Widget? child) {
                          return Padding(
                          padding: EdgeInsets.only(
                              top: (!_keyboardVisibilityValueNotifier.value)
                                  ? 30
                                  : 10, bottom: 10),
                          child: !obscureStateTextField.value
                              ? CustomButton.outline(
                            text: appStrings.submitReport,
                            textColor: context
                                .scheme()
                                .tertiaryText,
                            backgroundColor: context
                                .scheme()
                                .disabledText,
                            onPressed: () {},
                          )
                              : CustomButton.submit(
                            text: appStrings.submitReport,
                            showLoading: state.reportStatus.isLoading,
                            onPressed: () {
                              ReportRequest request =
                              ReportRequest(photos: _photos,
                                  subject: _subjController.text.trim(),
                                  description: _descController.text.trim());
                              context.read<ReportBloc>().add(ReportEvent
                                  .reportProblemEvent(request: request));
                            },
                          ),
                        );
                      }
                    ),

                  ],

                ),
              ),
            ));
      },
    );
  }

  void disableSubmitReport(ValueNotifier<bool> obscureStateTextField) {
     if (_subjController.text.isEmpty || _descController.text.isEmpty) {
      obscureStateTextField.value =false;
    }
    else
    {
      obscureStateTextField.value =true;
    }
  }

  Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      _files.add(file!);
      _photos?.add(File((file.path)));
      return file;
    }
    print('No Images Selected');
  }}
