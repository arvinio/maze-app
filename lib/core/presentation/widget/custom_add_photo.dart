import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class CustomAddPhoto extends StatelessWidget {
  const CustomAddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(25 ),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: context
              .scheme()
              .neutralsBackground,
          border: Border.all(color: context
              .scheme()
              .neutralsBorderDivider),
          borderRadius: const BorderRadius.all(
              Radius.circular(Dimen.defaultRadius)),
        ),
        child: appAssets.addReport.svg()
    );
  }
}
