import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/bottom_sheet_header.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/account_info/data/model/account_info_response.dart';
import 'package:maze_app/feature/account_info/presentation/bloc/account_info_bloc.dart';


class CountryDialogContent extends StatefulWidget implements AutoRouteWrapper {
  const CountryDialogContent({super.key});

  @override
  State<CountryDialogContent> createState() => _CountryDialogContentState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<AccountInfoBloc>(), child: this);
  }
}

class _CountryDialogContentState extends State<CountryDialogContent> {
  final _focusNode = FocusNode();
  double dialogHeightPercent = 0.7; //0, 1



  @override
  void initState() {
    _fetchCountryList(context);
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          dialogHeightPercent = 0.95;
        });
      } else {
        setState(() {
          dialogHeightPercent = 0.8;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SafeArea(
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * dialogHeightPercent,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: context.scheme().neutralsBackground,
                          boxShadow:   [
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
                               BottomSheetHeader.withHandler(
                                showDivider: true,
                                title: appStrings.country,
                              ),
                              BlocBuilder<AccountInfoBloc, AccountInfoState>(builder: (context, state) {
                                if (state.infoStatus.isLoading) {
                                  return Expanded(
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 38,
                                              height: 38,
                                              child: CircularProgressIndicator(
                                                  strokeWidth: 3.8,
                                                  valueColor:
                                                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
                                            ),
                                            const SizedBox(height: 28),
                                          ],
                                        ),
                                      ));
                                } else if (state.infoStatus.isLoadAllCountryList) {
                                  return Expanded(
                                      child: ListView(
                                          shrinkWrap: false,
                                          children: (state.allFetchedCountryList ?? [] )
                                              .map((e) => Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              child: Padding(
                                                  padding:
                                                  const EdgeInsets.symmetric(vertical: 13, horizontal: 30),
                                                  child:
                                                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                                    CustomText(e.name!),
                                                  ])),
                                              onTap: () => _onSelect(context, e),
                                            ),
                                          ))
                                              .toList()));

                                } else if (state.infoStatus.isFetchFailure) {
                                  return _failureModeWidget(context);
                                } else {
                                  return Container();
                                }
                              })
                            ],
                          ))))
            ],
          ),
        ),
      ),
    );
  }


  _failureModeWidget(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              appStrings.errorFetchInformation,
              style: context.titleTitle2.copyWith(color: context.scheme().primariesShade03, height: 1.3),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomButton.submit(
              text: appStrings.tryAgain,
              textFontSize: 15,
              horizontalPadding: 20,
              minSize: 42,
              onPressed: () {
                _fetchCountryList(context);
              },
              isFullWidth: false,
            ),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }

  _onSelect(BuildContext context, Result result) {
    debugPrint('with reason:${result.name}');
    Navigator.pop(context, result);
  }

  _fetchCountryList(BuildContext context) {
    context.read<AccountInfoBloc>().add(const AccountInfoEvent.fetchCountryListEvent());
  }


}



class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
