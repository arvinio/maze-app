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
import 'package:maze_app/feature/account_info/presentation/bloc/account_info_bloc.dart';


class HouseholdSizeInfoDialogContent extends StatefulWidget implements AutoRouteWrapper {
  const HouseholdSizeInfoDialogContent({super.key});

  @override
  State<HouseholdSizeInfoDialogContent> createState() => _HouseholdSizeInfoDialogContentState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<AccountInfoBloc>(), child: this);
  }
}

class _HouseholdSizeInfoDialogContentState extends State<HouseholdSizeInfoDialogContent> {
  double dialogHeightPercent = 0.2;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        color: Colors.transparent,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.2,
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
                    child: Column(
                      children: [
                        BottomSheetHeader(
                          showDivider: false,
                          title: appStrings.householdSizeInfoTitle,
                          closeIcon: appAssets.close.svg(),
                        ),
                        Expanded(
                            child: CustomText(appStrings.householdSizeInfoSubTitle))


                      ],
                    )
                ))
          ],
        ),
      ),
    );
  }
}

