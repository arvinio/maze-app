import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';

class NoImage extends StatelessWidget {
  const NoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(appStrings.noImage,textAlign: TextAlign.center);
  }
}
