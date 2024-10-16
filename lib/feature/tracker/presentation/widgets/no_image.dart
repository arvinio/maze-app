import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';

class NoImage extends StatelessWidget {
  const NoImage({
    super.key, this.fontSize, this.color,
  });
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomText(appStrings.noImage,textAlign: TextAlign.center,
        style: context.captionCaptionSemibold.copyWith(fontSize: fontSize,color: color));
  }
}
