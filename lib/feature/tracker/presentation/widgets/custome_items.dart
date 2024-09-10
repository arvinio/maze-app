import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class CustomeItem extends StatelessWidget {
  const CustomeItem({
    super.key,
    required this.title,
    this.height,
    this.func,
    this.trailing,
    this.leading,
  });
  final String title;
  final double? height;
  final Function? func;
  final Widget? trailing;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func == null ? null : () => func!(),
      child: Container(
        height: height,
        padding: EdgeInsets.all(10.dg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 270.w,
              child: Row(children: [
                if (leading != null) Flexible(child: leading!),
                SizedBox(
                  width: 10.w,
                ),
                CustomText(title),
              ]),
            ),
            if (trailing != null) Flexible(child: trailing!)
          ],
        ),
      ),
    );
  }
}
