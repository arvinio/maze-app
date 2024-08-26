import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chatBot_home_page.dart';
import 'package:maze_app/feature/profile/presentation/view/profile_home_page.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/view/knowledge_page.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import 'custom_button.dart';
import 'custom_text.dart';

@RoutePage()
class BottomNavigation extends StatefulWidget implements AutoRouteWrapper {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<KnowledgeCubit>(), child: this);
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  int index=0;

  static const List<Widget> _pages = <Widget>[
    Scaffold(
      body: Center(
        child: Text("page must be added here"),
      ),
    ),
    KnowledgePage(),
   ChatBotHomePage(),
    Scaffold(
      body: Center(
        child: Text("page must be added here"),
      ),
    ),
    ProfileHomePage()

  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  late TutorialCoachMark tutorialCoachMark;

  GlobalKey keyBottomCommunity = GlobalKey();
  GlobalKey keyBottomKnowledge = GlobalKey();
  GlobalKey keyBottomLiveChat = GlobalKey();
  GlobalKey keyBottomTracker = GlobalKey();
  GlobalKey keyBottomProfile = GlobalKey();
  GlobalKey keyBottomThanksForListening = GlobalKey();
  final isShowTutorial =inject<SettingsManager>().isShowTutorial() ?? 0;

  @override
  void initState() {
    super.initState();
    if(isShowTutorial==1) {
      modalBottomSheetApp();
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            key: keyBottomCommunity,
            icon: appAssets.communityIcon.svg(
              color: _selectedIndex == 0
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            key: keyBottomKnowledge,
            icon: appAssets.knowledgeIcon.svg(
              color: _selectedIndex == 1
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            label: 'Knowledge',
          ),
          BottomNavigationBarItem(
            key: keyBottomLiveChat,
            icon: appAssets.liveChatIcon.svg(
              color: _selectedIndex == 2
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            label: 'Live chat',
          ),
          BottomNavigationBarItem(
            key: keyBottomTracker,
            icon: appAssets.trackerIcon.svg(
              color: _selectedIndex == 3
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            label: 'Tracker',
          ),
          BottomNavigationBarItem(
            key: keyBottomProfile,
            icon: appAssets.profileIcon.svg(
              color: _selectedIndex == 4
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        unselectedItemColor: Theme.of(context).colorScheme.tertiaryText,
      ),
    );
  }

  void modalBottomSheetApp() {
    Future.delayed(Duration.zero).then((_) {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        //barrierColor: Colors.black,
        context: context,
        sheetAnimationStyle: AnimationStyle(
          duration: const Duration(seconds: 3),
          reverseDuration: const Duration(seconds: 1),
        ),
        builder: (BuildContext context) {
          return  Container(
              height: MediaQuery.of(context).size.height*0.4,
              padding: const EdgeInsets.all(20),
              child: initialDialogTutorial(context,appStrings.tutorialTitleMsg,appStrings.tutorialSubTitleMsg));
        },
      );

    });
  }

  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      hideSkip: true,
      colorShadow: Colors.black,
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails
                .localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.addAll([
      targetFocusWidget(keyBottomCommunity,appStrings.community,appStrings.communityTutorial,appStrings.next),
      targetFocusWidget(keyBottomKnowledge,appStrings.knowledge,appStrings.knowledgeTutorial,appStrings.next),
      targetFocusWidget(keyBottomLiveChat,appStrings.liveChat,appStrings.liveChatTutorial,appStrings.next),
      targetFocusWidget(keyBottomTracker,appStrings.tracker,appStrings.trackerTutorial,appStrings.next),
      targetFocusWidget(keyBottomProfile,appStrings.profile,appStrings.profileTutorial,appStrings.next),
      targetFocusWidget(keyBottomProfile,appStrings.thanksForListening,appStrings.finishTutorial,appStrings.finishWalkthrough),

    ]);

    return targets;
  }

  TargetFocus targetFocusWidget(GlobalKey<State<StatefulWidget>>? keyTarget,String title,String subTitle,String? buttonText) {
    return TargetFocus(
      enableTargetTab: false,
      keyTarget: keyTarget,
      alignSkip: Alignment.topRight,
      shape: ShapeLightFocus.RRect,
      focusAnimationDuration: const Duration(milliseconds: 0),
      unFocusAnimationDuration: const Duration(milliseconds: 0),
      radius: 12,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {

            return tutorialWidget(context,title,subTitle,buttonText);

          },
        ),
      ],
    );
  }

  Column tutorialWidget(BuildContext context,String title,String subTitle,String? buttonText) {
    return Column(
      children: [
        ListTile(
          title: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 12, 20),
            decoration: BoxDecoration(
              color: context
                  .scheme()
                  .neutralsFieldsTags,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(Dimen.defaultRadius),
                  topLeft: Radius.circular(Dimen.defaultRadius),
                  bottomRight: Radius.circular(Dimen.defaultRadius),
                  bottomLeft: Radius.circular(6.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title, style: context.titleHeadline,),
                const SizedBox(height: 10),

                CustomText(
                  subTitle,
                  style: context.subheadlineSubheadline,),
              ],
            ),
          ),
          leading: Image.asset(
            appAssets.chatBot.path, width: 32, height: 32,),
          contentPadding: const EdgeInsets.fromLTRB(0, 12, 10, 12),
          horizontalTitleGap: 8,
        ),

        Row(
          children: [
            SizedBox(width: MediaQuery
                .of(context)
                .size
                .width * 0.4,
              child: Center(
                child: CustomButton.outline(
                  text:appStrings.back,
                  textStyle: context.subheadlineSubheadlineSemibold.copyWith(
                      color: context
                          .scheme()
                          .primary),
                  onPressed: () {
                    if (_selectedIndex != 4) {
                      if(_selectedIndex==0)
                        {
                          tutorialCoachMark.goTo(-1);
                        }else {
                        index = _selectedIndex - 1;
                        tutorialCoachMark.goTo(index);
                        _onItemTapped(index);
                      }
                    } else {
                      if (index ==5) {
                        index = index - 1;
                        tutorialCoachMark.goTo(index);
                        _onItemTapped(index);
                      }else if(index==4)
                          {
                            index = index - 1;
                            tutorialCoachMark.goTo(index);
                            _onItemTapped(index);
                          }
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
                width: 20),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.4,
              child: CustomButton.submit(
                textStyle: context.subheadlineSubheadlineSemibold.copyWith(
                    color: context
                        .scheme()
                        .whiteText),
                text:buttonText ?? appStrings.next,
                onPressed: () {

                  if(_selectedIndex!=4) {
                    index = _selectedIndex + 1;
                    tutorialCoachMark.goTo(index);
                    _onItemTapped(index);

                  }else
                    {
                      if(index<5) {
                        index=index+1;
                        tutorialCoachMark.goTo(5);
                        _onItemTapped(4);
                      }else
                        {
                          tutorialCoachMark.goTo(-1);
                        }

                    }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column initialDialogTutorial(BuildContext context,String title,String subTitle) {
    return Column(
      children: [
        ListTile(
          title: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 12, 20),
            decoration: BoxDecoration(
              color: context
                  .scheme()
                  .neutralsFieldsTags,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(Dimen.defaultRadius),
                  topLeft: Radius.circular(Dimen.defaultRadius),
                  bottomRight: Radius.circular(Dimen.defaultRadius),
                  bottomLeft: Radius.circular(6.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title, style: context.titleHeadline,),
                const SizedBox(height: 10),

                CustomText(
                  subTitle,
                  style: context.subheadlineSubheadline,),
              ],
            ),
          ),
          leading: Image.asset(
            appAssets.chatBot.path, width: 32, height: 32,),
          contentPadding: const EdgeInsets.fromLTRB(0, 12, 10, 12),
          horizontalTitleGap: 8,
        ),
        Row(
          children: [
            SizedBox(width: MediaQuery
                .of(context)
                .size
                .width * 0.4,
              child: Center(
                child: CustomButton.outline(
                  text: appStrings.noThanks,
                  textStyle: context.subheadlineSubheadlineSemibold.copyWith(
                      color: context
                          .scheme()
                          .primary),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            const SizedBox(
                width: 20),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.4,
              child: CustomButton.submit(
                textStyle: context.subheadlineSubheadlineSemibold.copyWith(
                    color: context
                        .scheme()
                        .whiteText),
                text: appStrings.yesPlease,
                onPressed: () {
                  Navigator.pop(context);
                  createTutorial();
                  Future.delayed(Duration.zero, showTutorial);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

