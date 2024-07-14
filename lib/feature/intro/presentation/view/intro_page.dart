import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/intro/presentation/bloc/splash_bloc.dart';

@RoutePage()
class IntroPage extends StatefulWidget implements AutoRouteWrapper {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<SplashBloc>(), child: this);
  }
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  late Size size;

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(
      'assets/images/intro/$assetName',
      width: width,
    );
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        bodyTextStyle: bodyStyle,
        bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
        imageFlex: 7,
        bodyFlex: 2);
    size = MediaQuery.of(context).size;
    return  BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if(state.splashStatus.isSplashDone)
            {
              context.pushRoute(const SignupPageRoute());
            }

        },
        builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                const SizedBox(
                    // height: size.height * .15,
                    ),
                SizedBox(
                  height: size.height,
                  width: 500,
                  child: IntroductionScreen(
                    // showBottomPart: true,
                    key: introKey,
                    globalBackgroundColor: Colors.white,
                    // globalHeader: Align(
                    //   alignment: Alignment.topRight,
                    //   child: SafeArea(
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(top: 16, right: 16),
                    //       // child: _buildImage('flutter.png', 100),
                    //     ),
                    //   ),
                    // ),

                    pages: [
                      PageViewModel(
                          body: "Body will be displayed in here ",
                          title: "Title here",
                          image: _buildImage('intro-page-1.png'),
                          decoration: pageDecoration),
                      PageViewModel(
                          body: "Body will be displayed in here ",
                          title: "Title here",
                          image: _buildImage('intro-page-2.png'),
                          decoration: pageDecoration),
                      PageViewModel(
                          body: "Body will be displayed in here ",
                          title: "Title here",
                          image: _buildImage('intro-page-3.png'),
                          decoration: pageDecoration),
                    ],

                    // overrideNext: CustomButton.outline(
                    //   text: "Next",
                    //   onPressed: () {
                    //     IntroductionScreenState().next();
                    //   },
                    // ),
                    next: const Text("Next", style: TextStyle(fontSize: 20)),
                    onDone: () => context.read<SplashBloc>().add(const SplashEvent.onDone()),
                    done: const Text(
                      "Done",
                      style: TextStyle(fontSize: 20),
                    ),
                    doneStyle: OutlinedButton.styleFrom(
                        fixedSize: Size(size.width * .1, size.height * .065),
                        side: BorderSide(
                            width: 2,
                            color: Theme.of(context)
                                .colorScheme
                                .neutralsBorderDivider)),
                    nextStyle: OutlinedButton.styleFrom(
                        fixedSize: Size(size.width * .1, size.height * .065),
                        side: BorderSide(
                            width: 2,
                            color: Theme.of(context)
                                .colorScheme
                                .neutralsBorderDivider)),
                    skipStyle: OutlinedButton.styleFrom(
                        fixedSize: Size(size.width * .1, size.height * .065),
                        foregroundColor:
                            Theme.of(context).colorScheme.tertiaryText,
                        side: BorderSide(
                            width: 2,
                            color: Theme.of(context)
                                .colorScheme
                                .neutralsBorderDivider)),
                    skip: const Text(
                      "Skip",
                      style: TextStyle(fontSize: 20),
                    ),
                    showNextButton: true,
                    showSkipButton: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
