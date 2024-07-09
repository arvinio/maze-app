import 'package:flutter/material.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';

class PageLoading extends StatelessWidget {
  const PageLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BasePageWidget(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
