import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class ChatResultWidget extends StatelessWidget {
  const ChatResultWidget({
    super.key,
    required this.result,
  });

  final String result;

  @override
  Widget build(BuildContext context) {
    return
      ListTile(
        title: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: context
                .scheme()
                .neutralsFieldsTags,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(Dimen.defaultRadius),
                topLeft: Radius.circular(Dimen.defaultRadius),
                bottomRight: Radius.circular(Dimen.defaultRadius),
                bottomLeft: Radius.circular(4.0)),
          ),
          child: CustomText(
            result,
            style: context.bodyBody,),
        ),
        leading: Image.asset(appAssets.chatBot.path, width: 32, height: 32,),
        contentPadding: const EdgeInsets.fromLTRB(0, 12, 30, 12),
        horizontalTitleGap: 8,
      );
  }
}

