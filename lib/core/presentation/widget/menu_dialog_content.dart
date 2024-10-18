import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/presentation/widget/bottom_sheet_header.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class MenuDialogContent extends StatelessWidget {
  final String header;
  final Widget? child;
  final double dialogHeightPercent;

  const MenuDialogContent({
    super.key,
    required this.header,
    this.child,
    required this.dialogHeightPercent,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    const sheetBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(Dimen.popupRadius),
      topRight: Radius.circular(Dimen.popupRadius),
    );
    const itemsBorderRadius =
        BorderRadius.all(Radius.circular(Dimen.defaultRadius));
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: h * dialogHeightPercent,
        child: Ink(
            decoration: BoxDecoration(
              color: context.scheme().neutralsBackground,
              boxShadow: [
                BoxShadow(
                  color: context.scheme().selectIconDropDown,
                  spreadRadius: 1,
                  blurRadius: 4,
                )
              ],
              borderRadius: sheetBorderRadius,
            ),
            child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomSheetHeader(
                      showDivider: false,
                      title: header,
                      closeIcon: appAssets.close.svg(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Material(
                        borderRadius: itemsBorderRadius,
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        child: Ink(
                          decoration: BoxDecoration(
                            color: context.scheme().neutralsBackground,
                            border: Border.all(
                                color: context.scheme().neutralsBorderDivider),
                            borderRadius: itemsBorderRadius,
                          ),
                          child: child,
                        ),
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
