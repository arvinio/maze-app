import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maze_app/core/config/dimen.dart';

class BasePageWidget extends StatefulWidget {
  const BasePageWidget({
    super.key,
    required this.child,
    this.backgroundColor,
    this.statusBarColor,
    this.systemNavigationBarColor,
    this.statusBarIconBrightness,
    this.appBar,
    this.onScreenLoadingModeShowCircularLoadingByState = false,
    this.onScreenLoadingModeDescription,
    this.onScreenLoadingModeShowFailureByState,
    this.onScreenLoadingOnTryAgainCLick,
    this.bottomNav,
    this.failureMessage,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButton,
    this.appBarHeight,
    this.pagePaddingHorizontal,
    this.floatingActionButtonLocation,
  });

  final Widget child;
  final Widget? bottomNav;
  final Color? backgroundColor;
  final Color? statusBarColor;
  final Color? systemNavigationBarColor;
  final Brightness? statusBarIconBrightness;
  final Widget? appBar;
  final bool? onScreenLoadingModeShowCircularLoadingByState;
  final String? onScreenLoadingModeDescription;
  final bool? onScreenLoadingModeShowFailureByState;
  final Function? onScreenLoadingOnTryAgainCLick;
  final String? failureMessage;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final double? appBarHeight;
  final double? pagePaddingHorizontal;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  State<BasePageWidget> createState() => _BasePageWidgetState();
}

class _BasePageWidgetState extends State<BasePageWidget> {
  @override
  Widget build(BuildContext context) {
    return getScaffold();
  }

  getScaffold() {
    return Scaffold(
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation ??
          FloatingActionButtonLocation.startDocked,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset ?? true,
      backgroundColor: widget.backgroundColor,
      appBar: widget.appBar != null
          ? PreferredSize(
        preferredSize:
        Size.fromHeight(widget.appBarHeight ?? Dimen.appBarHeight),
        child: widget.appBar ?? const SizedBox(),
      )
          : null,
      bottomNavigationBar: widget.bottomNav,
      body: SafeArea(
        child: _getMainWidget(context),
      ),
    );
  }

  Widget _getMainWidget(BuildContext context) {
    return Container(
        padding:  EdgeInsets.symmetric(
          horizontal: widget.pagePaddingHorizontal ?? Dimen.pagePaddingHorizontal,
        ),
        child: widget.child);
  }
}