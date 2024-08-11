import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/chatbot/presentation/bloc/chat_bot_bloc.dart';


@RoutePage()
class ChatPage extends StatefulWidget implements AutoRouteWrapper {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<ChatBotBloc>(), child: this);
  }
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController _chatController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  ValueNotifier<bool> obscureState = ValueNotifier(false);


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;

    return BasePageWidget(
        appBarHeight: 80,
        appBar: Padding(
            padding: const EdgeInsets.only(top: 56, bottom: 14, left: 5),
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
                trailing: appAssets.more.svg())),


        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: context
                    .scheme()
                    .neutralsBorderDivider,
                indent: 0,
                endIndent: 0,
                thickness: 1,),
              const SizedBox(height: 30,),
              //Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Divider(
                    color: context
                        .scheme()
                        .neutralsBorderDivider,
                    indent: 0,
                    endIndent: 0,
                    thickness: 1,),
                  const SizedBox(height: 15,),
                  ValueListenableBuilder(
                    valueListenable: obscureState,
                    builder:
                        (BuildContext context, bool obscureValue, Widget? child) {
                      return CustomTextField.outline(
                        textEditingController: _chatController,
                        hint: appStrings.message,
                        autoFocus: false,
                        borderColor: context
                            .scheme()
                            .neutralsFieldsTags,
                        maxLines: 1,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child:obscureState.value? appAssets.sendMsgActive.svg(
                              width: 20, height: 20)
                          :appAssets.sendMsgInactive.svg(
                              width: 20, height: 20),

                        ),
                        //    padding: const EdgeInsets.only(left: 20,right: 5,),
                      );
                    },
                  )
                ],)

            ],),
        )
    );
  }
}

