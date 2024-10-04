import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maze_app/core/config/assets/assets.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    super.key, this.padding,
  });

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.maybePop();
      },
      icon: appAssets.close.svg(
          width: 24, height: 24) /* const Icon(Icons.cancel)*/,
      padding: padding ?? EdgeInsets.zero, alignment: Alignment.topLeft,

    );
  }
}
