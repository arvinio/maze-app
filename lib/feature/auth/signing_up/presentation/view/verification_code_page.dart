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
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/feature/auth/account_creation/presentation/view/account_creation_page.dart';


@RoutePage()
class VerificationCodePage extends StatefulWidget {

   const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {

  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();

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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              multiTextField(controller1, focusNode1,autoFocus: true),
              const SizedBox(width: 16,),
              multiTextField(controller2, focusNode2),
              const SizedBox(width: 16,),
              multiTextField(controller3, focusNode3),
              const SizedBox(width: 16,),
              multiTextField(controller4, focusNode4),
              const SizedBox(width: 16,),
              multiTextField(controller5, focusNode5),
            ],),

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

  Widget multiTextField(TextEditingController controller, FocusNode focusNode,{bool autoFocus=false,
    TextInputAction action=TextInputAction.next} ) {
    return SizedBox(
      width: 56, height: 56,
      child: CustomTextField.outline(
        autoFocus:autoFocus ,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textEditingController: controller,
        focusNode: focusNode,
        textInputAction: action,
        onEditingComplete: (){
         // FocusScope.of(context).nextFocus();

        },
      ),
    );
  }
}

/*  child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    focusNodes![index] = FocusNode();
                    controllers![index] = TextEditingController();
                    return SizedBox(
                      width: 56, height: 56,
                      child: CustomTextField.outline(
                        autoFocus: true,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textEditingController: controllers![index],
                        focusNode: focusNodes![index],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 14);
                  },
                ),*/