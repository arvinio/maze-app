
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';

import '../view/manage_bins/presentation/view/manage_bins_dialog_content.dart';

class ShowDialog {
  static void sizeInfo(BuildContext context,) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return MenuDialogContent(
              header: appStrings.info,
              dialogHeightPercent: 0.25,
              color: Colors.transparent,
              child: CustomText(appStrings.infoMsg, style: context.bodyBody));
        });
  }

  static Future<dynamic> openModalBottomSheet(BuildContext context,
      {Widget? child}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: context
          .scheme()
          .neutralsBackground,
      context: context,
      builder: (context) {
        return Container(
          height: 780.h,
          padding: const EdgeInsets.symmetric(
            horizontal: Dimen.pagePaddingHorizontal,
          ),
          child: child,
        );
      },
    );
  }

  static Future<dynamic> openModalBottomSheet2(BuildContext context, TrackerBloc bloc,
      {Widget? child}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: context
          .scheme()
          .neutralsBackground,
      context: context,
      builder: (builder) {
        return ManageBinsDialogContent(bloc: bloc).wrappedRoute(context);

      },
    );
  }

  static void needHelpContent(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return MenuDialogContent(
            header: appStrings.needHelp,
            dialogHeightPercent: 0.32,
            color: context
                .scheme()
                .neutralsBorderDivider,
            child: Column(children: [
              CustomMenuItems(
                title: appStrings.startLiveChat,
                leading: appAssets.liveChat.svg(),
                trailing: appAssets.rightArrow.svg(color: context
                    .scheme()
                    .tertiaryText),
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                onTap: () {
                  context.pushRoute(const ChatBotHomePageRoute());
                },
              ),
              Divider(color: context
                  .scheme()
                  .neutralsBorderDivider, indent: 45.w, endIndent: 15.w,),
              CustomMenuItems(
                title: appStrings.browseOurBeginnerArticles,
                leading: appAssets.browse.svg(),
                trailing: appAssets.rightArrow.svg(color: context
                    .scheme()
                    .tertiaryText),
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                onTap: () {
                  context.pushRoute(const KnowledgePageRoute());
                },

              )
            ],)
        );
      },
    );
  }

  static Future<dynamic> delete(BuildContext context,
      {String? title, String? subtitle, bool? showLoading, required void Function() onPressed}) {
    return showDialog(
      context: context,
      barrierColor: context
          .scheme()
          .neutralsBorderDivider,
      builder: (_) =>
          AlertDialog(
            title: CustomText(
                title!),
            content: CustomText(subtitle!),
            actions: [
              SizedBox(width: 100, height: 50,
                  child: CustomButton.submit(
                      text: appStrings.yes,
                      showLoading: showLoading ?? false,
                      onPressed: onPressed
                  )),
              SizedBox(width: 100,
                  height: 50,
                  child: CustomButton.outline(
                      text: appStrings.no, onPressed: () {
                    Navigator.of(context).pop();
                  }))
            ],
            elevation: 24,
            backgroundColor: context
                .scheme()
                .neutralsBackground,

          ),
      barrierDismissible: false,
    );
  }
}