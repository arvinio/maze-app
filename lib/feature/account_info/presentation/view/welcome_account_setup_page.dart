import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';

@RoutePage()
class WelcomeAccountSetupPage extends StatefulWidget {
  const WelcomeAccountSetupPage({super.key});

  @override
  State<WelcomeAccountSetupPage> createState() => _WelcomeAccountSetupPageState();
}

class _WelcomeAccountSetupPageState extends State<WelcomeAccountSetupPage> {
  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
                title: CustomText(
                  appStrings.accountSetupTitle, textAlign: TextAlign.center,
                  style: context.titleTitle1),
                subtitle: CustomText(appStrings.accountSetupSubTitle,
                    textAlign: TextAlign.center,
                    style: context.bodyBody)

            ),
          ],
        ));
  }
}