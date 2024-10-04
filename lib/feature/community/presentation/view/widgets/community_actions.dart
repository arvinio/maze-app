import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_Item_divider.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

import 'community_action_item.dart';

class CommunityActions extends StatelessWidget {
  const CommunityActions({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 400.w,
      height: 32,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          border: Border.all(color: context
              .scheme()
              .neutralsBorderDivider)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CommunityActionItem(
              icon: appAssets.heart.svg(),
              title: title,
            ),
            const CustomItemDivider(),
            CommunityActionItem(
              icon: appAssets.share.svg(),
              title: appStrings.share,
            ),
          ]),
    );
  }
}
