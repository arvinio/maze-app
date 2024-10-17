import 'package:flutter/material.dart';

class IgnoreOverflow extends StatelessWidget {
  /// You should wrap [Column] or [Row] with this widget!
  /// if you want to ignore the overflow of [Row] children, set [overflowDirection] to [Axis.horizontal]
  const IgnoreOverflow({
    super.key,
    required this.child,
    this.overflowDirection = Axis.vertical,
  });

  final Widget child;
  final Axis overflowDirection;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: overflowDirection,
      physics: const NeverScrollableScrollPhysics(),
      child: child,
    );
  }
}
