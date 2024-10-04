import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maze_app/core/config/assets/assets.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.maybePop();
      },
      icon:appAssets.arrowLeft.svg(width: 24,height: 24),
      padding: EdgeInsets.zero,alignment: Alignment.topLeft,
    );
  }
}
