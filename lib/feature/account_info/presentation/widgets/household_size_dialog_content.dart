import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/bottom_sheet_header.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';

import '../bloc/account_info_bloc.dart';


class HouseholdSizeDialogContent extends StatefulWidget implements AutoRouteWrapper {
  const HouseholdSizeDialogContent({super.key});

  @override
  State<HouseholdSizeDialogContent> createState() => _HouseholdSizeDialogContentState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<AccountInfoBloc>(), child: this);
  }
}

class _HouseholdSizeDialogContentState extends State<HouseholdSizeDialogContent> {
  double dialogHeightPercent = 0.4;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SafeArea(
        child: Container(
          color: Colors.transparent,
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height * 0.4,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: context
                              .scheme()
                              .neutralsBackground,
                          boxShadow: [
                            BoxShadow(
                              color: context
                                  .scheme()
                                  .selectIconDropDown,
                              spreadRadius: 1,
                              blurRadius: 4,
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(Dimen.popupRadius),
                              topRight: Radius.circular(
                                  Dimen.popupRadius))),
                      child: ScrollConfiguration(
                          behavior: CustomScrollBehavior(),
                          child: Column(
                            children: [
                              BottomSheetHeader.withHandler(
                                showDivider: true,
                                title: appStrings.householdSize,
                              ),
                              Expanded(
                                  child: ListView(
                                      shrinkWrap: false,
                                      children: ([
                                        "1 member",
                                        "2 members",
                                        "3 members",
                                        '4 members',
                                        '5 members'])
                                          .map((e) =>
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .symmetric(
                                                      vertical: 13,
                                                      horizontal: 30),
                                                  child:
                                                  Row(mainAxisAlignment: MainAxisAlignment
                                                      .start, children: [
                                                    CustomText(
                                                        e.toString()!),
                                                  ])),
                                              onTap: () =>
                                                  Navigator.pop(
                                                      context, e),
                                            ),
                                          ))
                                          .toList()))


                            ],
                          ))
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
