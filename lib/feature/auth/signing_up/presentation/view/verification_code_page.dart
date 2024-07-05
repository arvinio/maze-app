import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';
import 'package:maze_app/feature/auth/signing_up/presentation/bloc/verify_bloc.dart';
import 'package:timer_button_fork/timer_button_fork.dart';


@RoutePage()
class VerificationCodePage extends StatefulWidget implements AutoRouteWrapper{

  final String userName;
  final String userId;
  final EntryMode entryMode;

  const VerificationCodePage({super.key, required this.userId,required this.userName, required this.entryMode});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<VerifyBloc>(), child: this);
  }
}

class _VerificationCodePageState extends State<VerificationCodePage> {

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
        appBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 12, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: appAssets.arrowLeft.svg(width: 24, height: 24)),
            ],
          ),
        ),

        child:BlocConsumer<VerifyBloc, VerifyState>(
    listener: (context, state) {
      if (state.verifyStatus.isFailure) {
        //toast
      }
      else
      if(state.verifyStatus.isSuccess) {
        if(state.verifyResponse!.success!) {
          context.pushRoute(
              CreatePasswordPageRoute(entryMode: widget.entryMode,email:widget.userName));
        }
        else
          {
            Fluttertoast.showToast(
              msg:appStrings.invalidCode,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
      }
      else if(state.verifyStatus.isResendSuccess)
      {
        Fluttertoast.showToast(
          msg:appStrings.resendMsg,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );

      }
    },
    builder: (context, state) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: CustomText(
                  appStrings.verificationCode,
                  style: context.titleTitle1),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5),
                child: CustomText(
                    "${appStrings.codeSend}\n ${widget.userName}",
                    style: context.bodyBody),
              ),
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 5,
            ),
            const SizedBox(height: 35,),

            OtpTextField(
              numberOfFields: 5,
              showFieldAsBox: true,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              filled: true,
              autoFocus: true,
              textStyle: context.titleTitle2,
              contentPadding: const EdgeInsets.all(10),
              fillColor: context
                  .scheme()
                  .neutralsFieldsTags,
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimen.defaultRadius)),
              focusedBorderColor: context
                  .scheme()
                  .primary,
              enabledBorderColor: context
                  .scheme()
                  .neutralsFieldsTags,
             /* fieldHeight: 54,
              fieldWidth: 54,*/
              fieldHeight: 50,
              fieldWidth: 50,
              onCodeChanged: (String code) {},
              onSubmit: (String code) {

          context.read<VerifyBloc>().add(
          VerifyEvent.verifyCode(userId: widget.userId, code: code));

              }, // end onSubmit
            ),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child:TimerButton.builder(
                  onPressed: () {
                          //resend api
                    context.read<VerifyBloc>().add(
                        VerifyEvent.resend(userId: widget.userId));
                    },

                  timeOutInSeconds: 60,
                  timeBuilder: (BuildContext context, int sec) {
                    return Container(
                      padding: const EdgeInsets.all(10.0),
                      width:  MediaQuery
                          .of(context)
                          .size
                          .width,
                      height:56 ,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(16),
                        border: Border.all(color: context
                            .scheme()
                            .neutralsBorderDivider,),
                        color: context
                            .scheme()
                            .neutralsBackground,

                      ),
                      child: CustomText(
                        textAlign: TextAlign.center,sec > 0
                            ? "${appStrings.resendCode}${sec<10 ? "0$sec ": sec }"
                            : appStrings.resend,
                        style: context.titleHeadline.copyWith(
                            color: sec > 0
                                ? context
                                .scheme()
                                .disabledText
                                : context
                                .scheme()
                                .primary),
                      ),
                    );
                  },
                ),
            ),
          ],);
  },
)

    );
  }
}
