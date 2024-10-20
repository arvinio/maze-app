import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>( context.scheme().primary),
                backgroundColor: context.scheme().primariesShade03,
                strokeWidth: 2
            )));
  }
}
