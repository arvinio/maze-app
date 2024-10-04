import 'package:flutter/cupertino.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class CustomContainerList extends StatelessWidget {
  const CustomContainerList({super.key, required this.children, this.height, this.indent, this.endIndent});
  final List<Widget> children;
  final double? height;
  final double? indent;
  final double? endIndent;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? (children.length * 45.h) + 20.h,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: context.scheme().neutralsBackground,
        border: Border.all(color: context.scheme().neutralsBorderDivider),
        borderRadius:
            const BorderRadius.all(Radius.circular(Dimen.defaultRadius)),
      ),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return children[index];
          },
          separatorBuilder: (context, index) {
            return CustomDivider(
              indent: indent ?? 15.w, endIndent: endIndent ?? 15.w,);
          },
          itemCount: children.length),
    );
  }
}
