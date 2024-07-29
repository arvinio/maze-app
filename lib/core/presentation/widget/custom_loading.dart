import 'package:flutter/material.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class CustomLoading extends StatelessWidget {
  final String? message;

  const CustomLoading({this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      color: context.scheme().neutralsBackground,
      /*height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent.withOpacity(0.1),
      child: Center(
      child:Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimen.popupRadius),
            color: context.scheme().neutralsBackground),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Material(
            color: context.scheme().neutralsBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  message ?? appStrings.pleaseWait,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade),
              const SizedBox(height: 10),
                SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    ))*/

    );
  }
}
