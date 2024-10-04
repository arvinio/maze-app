import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/component/circle_avatar_component.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class CircleAvatarWidget extends StatelessWidget {
  // Vars
  final String? url;
  final String? path;
  final File? file;
  final String type;
  final OnTabCallBack onTab;
  final double? width;
  final double? height;
  final double? backgroundSize;
  final double? borderWidth;
  final Color? borderColor;
  final Widget? placeHolder;

  // Constructor
  const CircleAvatarWidget({
    super.key,
    this.url,
    this.path,
    this.file,
    this.width,
    this.height,
    this.backgroundSize,
    this.borderWidth,
    this.borderColor,
    this.placeHolder,
    required this.type,
    required this.onTab,
  });

  // Tree
  @override
  Widget build(BuildContext context) {
    return CircleAvatarComponent(
      url: url,
      path: path,
      file: file,
      type: type,
      iconData: Icons.image_outlined,
      iconSize: height ?? 44.h,
      iconColor: context.scheme().primary,
      backgroundSize: height != null ? height! / 2 : 44.h,
      backgroundColor: context.scheme().background,
      borderSize: height,
      onTap: onTab,
      width: width,
      height: height,
      borderWidth: borderWidth,
      borderColor: borderColor ?? context.scheme().tabBarBorderDivider,
      placeHolder: placeHolder ?? appAssets.placeHolderImage.image(),
    );
  }
}
