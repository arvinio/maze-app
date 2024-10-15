import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoPicker extends StatelessWidget {
   CustomCupertinoPicker({
    super.key,
     required this.children,
     this.initialItem,
    this.onSelectedItemChanged
  });

  final List<Widget> children;
  final int? initialItem;
  void Function(int)? onSelectedItemChanged;
  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      magnification: 1.3,
      squeeze: 1.2,
      useMagnifier: true,
      itemExtent: 40.0,
      scrollController: FixedExtentScrollController(
        initialItem:initialItem ?? 0,
      ),
      onSelectedItemChanged: onSelectedItemChanged,
      children:children
      );
  }
}
