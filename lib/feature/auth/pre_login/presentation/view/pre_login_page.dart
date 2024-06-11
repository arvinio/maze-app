import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/custom_text_span.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';


@RoutePage()
class PreLoginPage extends StatefulWidget {
  const PreLoginPage({super.key});

  @override
  State<PreLoginPage> createState() => _PreLoginPageState();
}

class _PreLoginPageState extends State<PreLoginPage> {
  final _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();
  late final ValueNotifier<bool> _keyboardVisibilityValueNotifier;

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityValueNotifier = ValueNotifier(true);

    /* _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
        });
      } else {
        setState(() {
        });
      }
    });*/
  }


  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _keyboardVisibilityValueNotifier.value = MediaQuery
        .of(context)
        .viewInsets
        .bottom != 0;

    double h = MediaQuery
        .of(context)
        .size
        .height;
    return BasePageWidget(
      resizeToAvoidBottomInset:false,
      child: SingleChildScrollView(
        child: SizedBox(
          height: h * 0.95,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: (!_keyboardVisibilityValueNotifier.value) ? 139 : 53,
                    bottom: 12),
                 // child:appAssets.appIcon.svg()
                  child: Image.asset(
                    'assets/icons/app.png',
                      width:(!_keyboardVisibilityValueNotifier.value)?150:100

                  ),
              ),
              ListTile(
                  title: CustomText(
                    appStrings.mazeComposting, textAlign: TextAlign.center,
                    style: context.titleTitle1,),
                  subtitle: CustomText(appStrings.doNotHaveAnAccountMsg,
                      textAlign: TextAlign.center,
                      style: context.bodyBody)
        
              ),
              SizedBox(height: !_keyboardVisibilityValueNotifier.value ? 66 : 38),
              CustomTextField.outline(textEditingController: _textController,
                label: appStrings.email,
                focusNode: _focusNode,
                labelTextColor: context
                    .scheme()
                    .secondaryText,
              ),
              const SizedBox(height: 16,),
              CustomButton.submit(
                text: appStrings.continueSteps,
                onPressed: () {
                 context.pushRoute(const VerificationCodePageRoute());

                },),
              const SizedBox(height: 16,),
              Visibility(
                visible: !_keyboardVisibilityValueNotifier.value,
                child: CustomButton.outline(
                  text: appStrings.loginAsGuest, onPressed: () {
                    context.pushRoute(const LoginPageRoute());
                },),
              ),
              (!_keyboardVisibilityValueNotifier.value)
                  ? const Spacer()
                  : const Center(),
              Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text.rich(textAlign: TextAlign.center,
                      CustomTextSpan(textData: appStrings.agreeMessage,
                          children: [
                            CustomTextSpan(textData: appStrings.termsOfService,
                                style: context.footnoteFootnoteBold.copyWith(
                                    color: context
                                        .scheme()
                                        .primary)),
                            CustomTextSpan(textData: 'and'),
                            CustomTextSpan(textData: appStrings.privacyPolicy,
                                style: context.footnoteFootnoteBold.copyWith(
                                    color: context
                                        .scheme()
                                        .primary))
                          ]))
              ),
            ],
          ),
        ),
      ),
    );
  }

}
