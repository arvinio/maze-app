import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class CustomViewPhoto extends StatelessWidget {
  const CustomViewPhoto({super.key, this.child, this.onPressed});
  final Widget? child;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.scheme().neutralsBackground,
              border: Border.all(
                  color: context.scheme().neutralsBorderDivider),
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimen.defaultRadius)),
            ),
            height: 90.h,
            width: 90.h,
            margin: EdgeInsets.only(right: 15.w),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimen.defaultRadius)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: FittedBox(
                fit: BoxFit.cover,
                child:child
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: IconButton(
              onPressed: onPressed,
              icon:  Icon(
                Icons.cancel,
                color:context.scheme().whiteText,
              ),
            ),
          )
        ]);
  }
}
