import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tab_item.dart';

class TrackerTabbar extends StatelessWidget {
  const TrackerTabbar({
    super.key,
    required TabController tabController,
    required this.title1,
    required this.title2,
  }) : _tabController = tabController;

  final TabController _tabController;
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30.sp)),
      child: Container(
        height: 35.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.sp)),
            color: context.scheme().tertiaryText.withOpacity(0.3)),
        child: Padding(
          padding: EdgeInsets.all(1.sp),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              border: Border.all(color: context.scheme().tertiaryText),
              color: context.scheme().whiteText,
              borderRadius: BorderRadius.all(Radius.circular(30.sp)),
            ),
            labelStyle: context.footnoteFootnote,
            labelColor: context.scheme().primaryText,
            unselectedLabelColor: Colors.black54,
            controller: _tabController,
            tabs: [
              TabItem(title: title1),
              TabItem(title: title2),
            ],
          ),
        ),
      ),
    );
  }
}
