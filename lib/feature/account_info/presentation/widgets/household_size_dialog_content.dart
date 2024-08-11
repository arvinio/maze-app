import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
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
  double dialogHeightPercent = 0.7;
  @override
  void initState() {
    super.initState();
  }

  List<String> size=[
    "1  member",
    "2  members",
    "3  members",
    '4  members',
    '5  members',
    '6  members',
    '7  members',
    '8  members',
    '9  members',
    '10  members',
    '11  members',
    '12  members',
    '13  members',
    '14  members',
    '15  members'
  ];


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
              .height * 0.9,
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
                              BottomSheetHeader(
                                title: appStrings.householdSize,
                                closeIcon: appAssets.close.svg(),
                                showDivider: false,
                              ),
                              Expanded(
                                  child:  Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: context
                                            .scheme()
                                            .neutralsBackground,
                                        border: Border.all(color: context
                                            .scheme()
                                            .neutralsBorderDivider),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(Dimen.defaultRadius)),
                                      ),
                                      child: ListView.separated(
                                        shrinkWrap: false,
                                        itemBuilder: (BuildContext context, int index) { return
                                          InkWell(
                                            child: Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(top: 30,left: 20),
                                                child:
                                                Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start, children: [
                                                  CustomText(
                                                      size[index].toString()!),
                                                  const SizedBox(height: 20,),

                                                ])),
                                            onTap: () =>
                                                Navigator.pop(
                                                    context,size[index]),
                                          ); },
                                        separatorBuilder: (BuildContext context, int index) { return Divider(color: context.scheme().neutralsBorderDivider,indent: 20,endIndent: 20,); },
                                        itemCount:size.length ,
                                      ),
                                    ),
                                  ),)


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
