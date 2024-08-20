import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/presentation/bloc/chat_bloc.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/presentation/widgets/ask_question_widget.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/presentation/widgets/chat_result_widget.dart';


@RoutePage()
class ChatPage extends StatefulWidget implements AutoRouteWrapper {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<ChatBloc>(), child: this);
  }
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController _chatController = TextEditingController();
  ValueNotifier<bool> obscureState = ValueNotifier(false);
  late final ValueNotifier<bool> _keyboardVisibilityValueNotifier;
  bool isVisibleRegenerate = false;
  String? chatId = "";

  List<Widget> list = [];
  Widget _questions = Center();
  Widget _chatResult = Center();



  @override
  void initState() {
    super.initState();
    _keyboardVisibilityValueNotifier = ValueNotifier(true);
  }

  @override
  void dispose() {
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
    _keyboardVisibilityValueNotifier.value =
        MediaQuery
            .of(context)
            .viewInsets
            .bottom != 0;

    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
      if (state.chatStatus.isChatLoading) {
          _questions =  AskQuestionWidget(question: _chatController.text, width: w);
          isVisibleRegenerate = false;
          list.add(_questions);
          _chatController.clear();
          _chatResult =SizedBox(width: w*0.27,child: const ChatResultWidget( result:"..."));
          isVisibleRegenerate = false;
          list.add(_chatResult);

        }

        else if (state.chatStatus.isChatSuccess) {
          chatId = state.chatResponse!.result!.chatId;
          list.removeAt(list.length-1);
          chatResultGenerate(state: state,width: w,isQuestionSuccess: false);
        }
        else if (state.chatStatus.isChatFailure) {
          Fluttertoast.showToast(
              msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        else if (state.chatStatus.isQuestionSuccess) {
          list.removeAt(list.length-1);
          chatResultGenerate(state: state,width: w, isQuestionSuccess: true);
        }
        else if (state.chatStatus.isQuestionFailure) {
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
        return BasePageWidget(
            appBarHeight: 80,
            appBar: Padding(
                padding: const EdgeInsets.only(top: 56, bottom: 5, left: 5),
                child: ListTile(
                  title: CustomText(
                    appStrings.chatBotTitle, style: context.titleHeadline,
                    textAlign: TextAlign.center,),
                  horizontalTitleGap: 0,
                  contentPadding: const EdgeInsets.only(left: 20, right: 20),
                  leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: appAssets.arrowLeft.svg(width: 24, height: 24)),
                 // trailing: appAssets.more.svg(),
                )),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Divider(
                  color: context
                      .scheme()
                      .neutralsBorderDivider,
                  indent: 0,
                  endIndent: 0,
                  thickness: 1,),
                const SizedBox(height: 10,),
                ListTile(
                  title: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context
                          .scheme()
                          .neutralsFieldsTags,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(Dimen.defaultRadius),
                          topLeft: Radius.circular(Dimen.defaultRadius),
                          bottomRight: Radius.circular(Dimen.defaultRadius),
                          bottomLeft: Radius.circular(4.0)),
                    ),
                    child: CustomText(
                      appStrings.chatMsg, style: context.bodyBody,),
                  ),
                  leading: Image.asset(
                    appAssets.chatBot.path, width: 32, height: 32,),
                  contentPadding: const EdgeInsets.fromLTRB(0, 12, 30, 12),
                  horizontalTitleGap: 8,
                ),
                 SizedBox(
                      height: (!_keyboardVisibilityValueNotifier.value)?h * 0.55:h*0.25,
                      child: ListView.builder(
                        itemCount: list.length,
                        scrollDirection: Axis.vertical,
                        // shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return list[index];
                        },
                      )),

                Divider(
                  color: context
                      .scheme()
                      .neutralsBorderDivider,
                  indent: 0,
                  endIndent: 0,
                  thickness: 1,),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: ValueListenableBuilder(
                    valueListenable: obscureState,
                    builder:
                        (BuildContext context, bool obscureValue,
                        Widget? child) {
                      return CustomTextField.outline(
                        textEditingController: _chatController,
                        hint: appStrings.message,
                        autoFocus: false,
                        borderColor: context
                            .scheme()
                            .neutralsFieldsTags,
                        maxLines: 1,
                        suffixIcon: InkWell(
                          onTap: () {


                            if(chatId!.isEmpty) {
                              context.read<ChatBloc>().add(
                                  ChatEvent.createChatEvent(question: _chatController.text));
                            }else
                            {
                              context.read<ChatBloc>().add(
                                  ChatEvent.askQuestionEvent(chatId: chatId!,question: _chatController.text));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 10.0, 0.0, 10.0),
                            child: obscureState.value ? appAssets.sendMsgActive
                                .svg(
                                width: 20, height: 20)
                                : appAssets.sendMsgInactive.svg(
                                width: 20, height: 20),

                          ),
                        ),
                        onTap: () {
                          obscureState.value = !obscureState.value;
                        },
                        onEditingComplete: () {
                          obscureState.value = !obscureState.value;
                        },
                        //    padding: const EdgeInsets.only(left: 20,right: 5,),
                      );
                    },
                  ),
                )

              ],)
        );
      },
    );
  }

  Visibility buildRegenerate(double w, BuildContext context) {
    return Visibility(
                            visible: isVisibleRegenerate,
                            child: Column(children: [
                              Container(
                                width: w,
                                padding: const EdgeInsets.fromLTRB(
                                    0, 16, 0, 16),
                                decoration: BoxDecoration(
                                  //color: context.scheme().primary,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(Dimen.defaultRadius)),
                                    border: Border.all(color: context
                                        .scheme()
                                        .neutralsBorderDivider)
                                ),
                                child: CustomText(appStrings.regenerateAnswer,
                                  textAlign: TextAlign.center,
                                  style: context
                                      .subheadlineSubheadlineSemibold
                                      .copyWith(color: context
                                      .scheme()
                                      .primary),),
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                width: w,
                                padding: const EdgeInsets.fromLTRB(
                                    0, 16, 0, 16),
                                decoration: BoxDecoration(
                                  //color: context.scheme().primary,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(Dimen.defaultRadius)),
                                    border: Border.all(color: context
                                        .scheme()
                                        .neutralsBorderDivider)
                                ),
                                child: CustomText(appStrings.speakToHuman,
                                  textAlign: TextAlign.center,
                                  style: context
                                      .subheadlineSubheadlineSemibold
                                      .copyWith(color: context
                                      .scheme()
                                      .primary),),
                              ),
                            ],),
                          );
  }

  void chatResultGenerate({required ChatState state,required double width,
      bool isQuestionSuccess=false}) {
    if (!isQuestionSuccess) {
      _chatResult =
          ChatResultWidget(result:state.chatResponse !=null? state.chatResponse!.result!.result! :'');
    } else {
      _chatResult =
          ChatResultWidget(result:state.questionResponse!=null? state.questionResponse!.result!.result! :'');
    }
    isVisibleRegenerate = true;
    list.add(_chatResult);
    list.add(buildRegenerate(width,context));
  }
}
