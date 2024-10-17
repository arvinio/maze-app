import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  final String? userName;
  final String? avatarUrl;

  const WelcomePage(
      {super.key, required this.userName, required this.avatarUrl});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 95,
            height: 95,
            child: CircleAvatar(
              backgroundColor: context.scheme().disabledText,
              radius: 100,
              backgroundImage: (widget.avatarUrl!.isNotEmpty)
                  ? NetworkImage(widget.avatarUrl!)
                  : ExactAssetImage(appAssets.avatarPng.path),
            ),
          ),
          ListTile(
              title: CustomText(
                (widget.userName != null)
                    ? '${appStrings.welcomeTitle} ${widget.userName}'
                    : appStrings.welcomeTitle,
                textAlign: TextAlign.center,
                style: context.titleTitle1,
              ),
              subtitle: CustomText(appStrings.welcomeSubTitle,
                  textAlign: TextAlign.center, style: context.bodyBody)),
        ],
      ),
    ));
  }
}
