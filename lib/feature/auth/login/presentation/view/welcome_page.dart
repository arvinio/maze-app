import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return  BasePageWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         /* SizedBox(
            width: 95,
            height: 95,
            child:*/ CircleAvatar(
              radius: 100,
             backgroundColor: Colors.transparent,
             // child: appAssets.profile.svg(),
              child: Image.asset(appAssets.profile.path),


            ),
         // ),

         // const SizedBox(height: 10,),
          ListTile(
              title: CustomText(
                appStrings.welcomeTitle, textAlign: TextAlign.center,
                style: context.titleTitle1,),
              subtitle: CustomText(appStrings.welcomeSubTitle,
                  textAlign: TextAlign.center,
                  style: context.bodyBody)

          ),
    ],));
  }
}
