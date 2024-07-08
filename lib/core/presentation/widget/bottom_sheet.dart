import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

import 'bottom_sheet_header.dart';


class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? subTitle;
  final Widget? icon;
  final Widget? closeIcon;
  final Function? onClosePressed;
  final bool showDivider;
  final bool isFullScreen;
  final bool isNumericTitle;
  final bool showHandler;
  final TextDirection? textDirection;
  final double? horizontalPadding;

  const CustomBottomSheet.oldStyle({
    super.key,
    required this.child,
    required this.title,
    required this.icon,
    this.onClosePressed,
    this.closeIcon,
    this.showDivider = true,
    this.isNumericTitle = false,
    this.horizontalPadding,
    this.textDirection,
    this.isFullScreen = false,
    this.subTitle,
  }) : showHandler = false;

  const CustomBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.textDirection,
    this.horizontalPadding,
    this.showDivider = false,
    this.subTitle,
  })  : showHandler = true,
        isFullScreen = false,
        icon = null,
        closeIcon = null,
        onClosePressed = null,
        isNumericTitle = false;

  const CustomBottomSheet.withoutHandler({
    super.key,
    required this.child,
    this.title,
    this.textDirection,
    this.horizontalPadding,
    this.isFullScreen = false,
    this.subTitle,
  })  : showHandler = false,
        icon = null,
        closeIcon = null,
        onClosePressed = null,
        showDivider = false,
        isNumericTitle = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            constraints: isFullScreen ? null : BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 30),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              right: showDivider ? 0 : horizontalPadding ?? 16,
              left: showDivider ? 0 : horizontalPadding ?? 16,
              top: (showHandler == false && title == null) ? 24 : 0,
            ),
            decoration: BoxDecoration(
              color: context.scheme().neutralsBackground,
              borderRadius: isFullScreen
                  ? null
                  : const BorderRadius.only(
                  topLeft: Radius.circular(Dimen.bottomSheetRadius),
                  topRight: Radius.circular(Dimen.bottomSheetRadius)),
            ),
            child: Column(
              mainAxisSize: isFullScreen ? MainAxisSize.max : MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (showHandler || title != null)
                  BottomSheetHeader(
                    title: title,
                    subTitle: subTitle,
                    closeIcon: closeIcon,
                    icon: icon,
                    isNumericTitle: isNumericTitle,
                    onClosePressed: onClosePressed,
                    showDivider: showDivider,
                    showHandler: showHandler,
                    textDirection: textDirection,
                  ),
                Flexible(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: showDivider ? (horizontalPadding ?? 16) : 0,
                        left: showDivider ? (horizontalPadding ?? 16) : 0,
                      ),
                      child: Column(children: [child]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
     /*   BlocBuilder<AppBaseBloc, AppBaseState>(
          builder: (context, overlayLoadingState) {
            return Visibility(
              visible: overlayLoadingState.overlayLoadingStatus.isStartLoadingOverBottomSheet,
              child: GestureDetector(
                onVerticalDragDown: (_) {},
                child: AbsorbPointer(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black.withOpacity(0.65),
                      child: const Center(
                        child: OverLayLoadingWidget(),
                      )),
                ),
              ),
            );
          },
        ),*/
      ],
    );
  }
}
