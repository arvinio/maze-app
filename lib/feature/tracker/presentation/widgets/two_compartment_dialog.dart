import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/bottom_sheet_header.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class TwoCompartmentDialog extends StatefulWidget {
  const TwoCompartmentDialog({super.key});

  @override
  State<TwoCompartmentDialog> createState() => _TwoCompartmentDialogState();
}

class _TwoCompartmentDialogState extends State<TwoCompartmentDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    List<String> measurementSystem = [
      "Yes",
      "No",
    ];

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SafeArea(
        child: Container(
          color: Colors.transparent,
          width: w,
          height: MediaQuery.of(context).size.height * 0.32,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: context.scheme().neutralsBackground,
                          boxShadow: [
                            BoxShadow(
                              color: context.scheme().selectIconDropDown,
                              spreadRadius: 1,
                              blurRadius: 4,
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(Dimen.popupRadius),
                              topRight: Radius.circular(Dimen.popupRadius))),
                      child: ScrollConfiguration(
                          behavior: CustomScrollBehavior(),
                          child: Column(
                            children: [
                              BottomSheetHeader(
                                title: appStrings.measurementSystem,
                                closeIcon: appAssets.close.svg(),
                                showDivider: false,
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: context.scheme().neutralsBackground,
                                    border: Border.all(
                                        color: context
                                            .scheme()
                                            .neutralsBorderDivider),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(Dimen.defaultRadius)),
                                  ),
                                  child: ListView.separated(
                                    shrinkWrap: false,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30, left: 20),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                      measurementSystem[index]
                                                          .toString()!),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                ])),
                                        onTap: () => Navigator.pop(
                                            context, measurementSystem[index]),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Divider(
                                        color: context
                                            .scheme()
                                            .neutralsBorderDivider,
                                        indent: 20,
                                        endIndent: 20,
                                      );
                                    },
                                    itemCount: measurementSystem.length,
                                  ),
                                ),
                              ))
                            ],
                          ))))
            ],
          ),
        ),
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
