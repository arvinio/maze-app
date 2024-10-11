import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabContentView extends StatelessWidget {
  final List<Widget> children;
  final TabController controller;

  const TabContentView({
    super.key,
    required this.children, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return children[controller.index];
        }
    );
  }
}