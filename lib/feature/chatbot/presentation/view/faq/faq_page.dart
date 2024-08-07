import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/bottom_sheet_header.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/chatbot/presentation/bloc/chat_bot_bloc.dart';
import 'package:maze_app/feature/chatbot/presentation/widgets/empty_list_widget.dart';


class FaqPage extends StatefulWidget implements AutoRouteWrapper {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<ChatBotBloc>(), child: this);
  }
}

class _FaqPageState extends State<FaqPage> {
  double dialogHeightPercent = 0.9; //0, 1

final List<int>? list=[];


  @override
  void initState() {
    _fetchFaqList(context);
    super.initState();
  }

  List< ValueNotifier<bool>>? obscureState ;

  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: h * dialogHeightPercent,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomSheetHeader(
                      showDivider: false,
                      title: '',
                     // icon: appAssets.close.svg(),
                      closeIcon:  appAssets.close.svg(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:24.0),
                      child: CustomText(appStrings.faqTitle,style: context.titleTitle1.copyWith(color: const Color(0xff0A0A0A))),
                    ),

                    BlocBuilder<ChatBotBloc, ChatBotState>(builder: (context, state) {
                      if (state.chatBotStatus.isLoading) {
                        return loadingWidget(context);
                      }
                      else if (state.chatBotStatus.isLoadAllFaq) {
                        obscureState= List.generate(state.allFetchedFaqList!.length, (index) => ValueNotifier(false));

                        return  state.allFetchedFaqList!.isNotEmpty
                        ?SizedBox(
                          height: h*0.75 ,

                          child: Padding(
                                        padding:
                                        const EdgeInsets.only(left:22.0,right: 24,top: 15,bottom: 0),
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          itemCount: state.allFetchedFaqList!.length,
                                          itemBuilder: (BuildContext context, int index) {

                                            return ValueListenableBuilder(
                                                valueListenable: obscureState![index],
                                                builder: (BuildContext context, bool obscureValue,
                                                    Widget? child) {
                                                  return  ! obscureState![index].value?  Container(
                                                    padding: const EdgeInsets.fromLTRB(12,5,5,10),
                                                    decoration: BoxDecoration(border: Border.all(color: context.scheme().neutralsBorderDivider),
                                                      borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                                                    ),
                                                    child: ListTile(
                                                      onTap: (){
                                                        obscureState![index].value=!obscureState![index].value;
                                                      },
                                                      title:CustomText(state.allFetchedFaqList![index].question!,style: context.bodyBodyMedium) ,
                                                      trailing:  appAssets.dropDown.svg(width: 24, height: 24),
                                                      contentPadding: EdgeInsets.zero,
                                                    ),

                                                  )
                                                      :Container(
                                                      padding: const EdgeInsets.fromLTRB(12,5,5,10),
                                                    decoration: BoxDecoration(border: Border.all(color: context.scheme().neutralsBorderDivider),
                                                      borderRadius: BorderRadius.circular(Dimen.defaultRadius),
                                                    ),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          ListTile(
                                                            onTap: (){
                                                              obscureState![index].value=!obscureState![index].value;
                                                            },
                                                            title:CustomText(state.allFetchedFaqList![index].question!,style: context.bodyBodyMedium) ,
                                                            trailing:  appAssets.dropUp.svg(width: 24, height: 24),
                                                            contentPadding: EdgeInsets.zero,
                                                          ),
                                                          const SizedBox(height: 10,),
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 10.0,left: 3),
                                                            child: Divider(color: context.scheme().neutralsBorderDivider,thickness: 1,),
                                                          ),
                                                          const SizedBox(height: 15,),
                                                          CustomText(state.allFetchedFaqList![index].answer!,style: context.bodyCallout),
                                                          const SizedBox(height: 5,),

                                                        ],
                                                      ),
                                                      );
                                                }
                                            );
                                          },
                                          separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 15,); },

                                        ),
                                        ),
                                  )
                            : emptyListWidget();

                      } else if (state.chatBotStatus.isFailure) {
                        return _failureModeWidget(context);
                      } else {
                        return Container();
                      }
                    })
                  ],
                ))),
      ),
    );
  }

  Expanded emptyListWidget() {
    return Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(appStrings.emptyList,textAlign: TextAlign.center,style: context.titleHeadline.copyWith(color: context.scheme().disabledText),),
                                const SizedBox(height: 28),
                              ],
                            ),
                          ));
  }

  Expanded loadingWidget(BuildContext context) {
    return Expanded(
                          child: Center(
                            child: Column(
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
              style: context.titleTitle2.copyWith(color: context
                  .scheme()
                  .primariesShade03, height: 1.3),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomButton.submit(
              text: appStrings.tryAgain,
              textFontSize: 15,
              horizontalPadding: 20,
              minSize: 42,
              onPressed: () {
                _fetchFaqList(context);
              },
              isFullWidth: false,
            ),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }


  _fetchFaqList(BuildContext context) {
    context.read<ChatBotBloc>().add(const ChatBotEvent.fetchFaqListEvent());
  }
}



class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

