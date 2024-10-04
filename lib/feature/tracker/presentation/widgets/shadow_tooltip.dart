import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/presentation/widget/info_icon.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class ShadowTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  const ShadowTooltip({
    super.key,
    required this.message,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Stack(
        children: [
          Positioned(
            top: 20.h,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.scheme().info.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0.sp),
                child: Row(
                  children: [
                    Flexible(
                      flex: 10,
                      child: Text(
                        message,
                        style: context.subheadlineSubheadlineMedium.copyWith(
                          color: context.scheme().info,
                        ),
                      ),
                    ),
                    const Flexible(child: InfoIcon())
                  ],
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
