import 'package:flutter/material.dart';

class DismissibleFocus extends StatelessWidget {
  final Widget? child;

  /// Focused widget in this widget will be unfocused on touch outside of it which makes a better user experience
  const DismissibleFocus({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => dismissFocus(context),
      child: child,
    );
  }
}

void dismissFocus(BuildContext context) {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}
