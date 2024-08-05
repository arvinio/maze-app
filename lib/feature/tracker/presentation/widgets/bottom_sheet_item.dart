import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';

class BottomSheetItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Widget leading;

  const BottomSheetItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: CustomText(title, style: context.bodyBody),
      leading: SizedBox(width: 24.w, height: 64.h, child: leading),
      trailing: SizedBox(width: 24.w, height: 64.h, child: const AppArrow()),
      contentPadding: const EdgeInsets.all(10),
    );
  }
}
