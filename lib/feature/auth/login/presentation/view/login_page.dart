import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/custom_text_span.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/feature/auth/login/presentation/view/welcome_page.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

final TextEditingController _controller = TextEditingController();

final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
        appBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 12, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: (){Navigator.pop(context);},
                  child: appAssets.arrowLeft.svg(width: 24, height: 24)),
            ],
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: CustomText(
                  appStrings.loginTitle,
                  style: context.titleTitle1),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5),
                child: Text.rich(
                    CustomTextSpan(
                        textData: appStrings.loginSubTitle,
                        style: context.bodyBody,
                        children: [
                          CustomTextSpan(textData:' Zahra.tafazoli@gmail.com',
                            style: context.bodyBodyMedium,

                          ),

                        ])),
              ),
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 5,
            ),

            const SizedBox(height: 35,),
            CustomTextField.outline(textEditingController: _controller,
                label: appStrings.password,
                focusNode: _focusNode,
                obscureText: true,
                autoFocus: true,
                suffix: appAssets.eye.svg()

            ),

            const Spacer(),
            CustomButton.outline(
              text: appStrings.forgotPassword, onPressed: () {
              context.pushRoute(const VerificationCodePageRoute());
            },),
            Padding(
              padding: const EdgeInsets.only(top:16,bottom: 16),
              child: CustomButton.submit(
                text: appStrings.continueSteps,
                onPressed: () {
                  context.pushRoute( const WelcomePageRoute());
                },),
            ),


          ],)

    );;
  }
}
