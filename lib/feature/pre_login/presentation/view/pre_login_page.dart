import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/custom_text_span.dart';
import 'package:maze_app/core/style/app_color.dart';
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

  @override
  void initState() {
    super.initState();

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
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return BasePageWidget(
      child: SingleChildScrollView(
        child: SizedBox(
          height: h * 0.95,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 83, bottom: 12),
                child: SizedBox(
                  width: 100, height: 100,
                  child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(21.3)),
                          side: BorderSide(color: Color(0xff000000))),
                      //8
                      color: Colors.white,
                      elevation: 5,
                      shadowColor: Color(0xff000000),
                      //12
                      //child: appAssets.appIcon.svg(width: 100, height: 100,)
                      child: Image.asset('assets/icons/app.png',width: 100, height: 100,)

                  ),
                ),
              ),
              ListTile(
                  title: CustomText(
                    appStrings.mazeComposting, textAlign: TextAlign.center,
                    style: context.titleTitle1,),
                  subtitle: CustomText(appStrings.doNotHaveAnAccountMsg,
                      textAlign: TextAlign.center, style: context.bodyBody)

              ),
              const SizedBox(height: 107,),
              CustomTextField.outline(textEditingController: _textController,
                hint: appStrings.email,
                focusNode: _focusNode,
              ),
              const SizedBox(height: 16,),
              CustomButton.submit(
                text: appStrings.continueSteps, onPressed: () {

              },),
              const SizedBox(height: 16,),
              CustomButton.outline(
                text: appStrings.loginAsGuest, onPressed: () {},),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text.rich(textAlign: TextAlign.center,
                  CustomTextSpan(textData: appStrings.agreeMessage,
                      children: [
                        CustomTextSpan(textData: appStrings.termsOfService,
                          style: context.footnoteFootnoteBold.copyWith(color:context.scheme().primary) ),
                        CustomTextSpan(textData: 'and'),
                        CustomTextSpan(textData: appStrings.privacyPolicy,
                            style:context.footnoteFootnoteBold.copyWith(color:context.scheme().primary) ) ]))
                ),
            ],
          ),
        ),
      ),
    );
  }
}
