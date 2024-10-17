import 'package:flutter/material.dart';

class CommentTextFieldDelegate extends SliverPersistentHeaderDelegate {
  /// Should pass the TextField widget (anything works)
  final Widget child;

  CommentTextFieldDelegate({
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
