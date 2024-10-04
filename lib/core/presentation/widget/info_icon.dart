import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class InfoIcon extends StatelessWidget {
  const InfoIcon({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.info,
      color: context.scheme().info,
    );
  }
}
