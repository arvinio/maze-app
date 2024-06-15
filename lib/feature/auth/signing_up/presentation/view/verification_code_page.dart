import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';


@RoutePage()
class VerificationCodePage extends StatefulWidget {

   const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {

  bool autoFocus=false;

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

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: CustomText(
                  appStrings.verificationCode,
                  style: context.titleTitle1),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5),
                child: CustomText(
                    "${appStrings.codeSend}\n zahra.tafazoli@gmail.com",
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
              fieldHeight: 56,
              fieldWidth: 56,
              onCodeChanged: (String code) {
              },
              onSubmit: (String verificationCode) {
               // context.pushRoute(const AccountCreationPageRoute());
                context.pushRoute(const ForgotPasswordPageRoute());
              }, // end onSubmit
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomButton.outline(
                text: appStrings.reSend, onPressed: () {
                context.pushRoute(const AccountCreationPageRoute());
              },),
            ),
          ],)

    );
  }
}
