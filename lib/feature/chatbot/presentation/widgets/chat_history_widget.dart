import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class ChatHistoryWidget extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final void Function()? onTap;
  const ChatHistoryWidget({
    super.key,
    required this.title, this.leading, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        InkWell(
          onTap: onTap,
          child: Container(
            padding:const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.scheme().neutralsBackground,
              border: Border.all(color:  context.scheme().neutralsBorderDivider,width: 1),
              borderRadius:
              BorderRadius.circular(Dimen.defaultRadius),
            ),
            child: ListTile(
              title: CustomText(title!,style: context.bodyBody),
              leading:leading ?? appAssets.message.svg(),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}