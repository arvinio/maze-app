import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';

class CustomMenuItems extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Widget? subTitle;
  final Widget? leading;
  final Widget? trailing;
  void Function()? onTap;
  EdgeInsetsGeometry? padding;
  CustomMenuItems({
    super.key,
     required this.title, this.subTitle, this.leading, this.trailing,this.onTap, this.titleColor,this.padding
  });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: CustomText(title, style: context.bodyBody.copyWith(color: titleColor)),
      tileColor: titleColor,
      subtitle:subTitle,
      leading: SizedBox(width: 24, height: 64, child: leading),
      trailing: SizedBox(width: 24, height: 64, child: trailing),
      contentPadding:padding ?? const EdgeInsets.only(left: 20,top: 8,bottom: 8),
    );
  }
}

