import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/app_loading.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/intro/presentation/bloc/splash_bloc.dart';

@RoutePage()
class SplashLoadingPage extends StatefulWidget implements AutoRouteWrapper {
  const SplashLoadingPage({super.key});

  @override
  State<SplashLoadingPage> createState() => _SplashLoadingPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<SplashBloc>(), child: this);
  }
}

class _SplashLoadingPageState extends State<SplashLoadingPage> {
  @override
  void initState() {
    context.read<SplashBloc>().add(const SplashEvent.init());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if(state.splashStatus.isSuccess){
          context.read<SplashBloc>().add(const SplashEvent.onLoadAppData());

        }
        else  if(state.splashStatus.isUserLoggedIn){
          context.pushRoute(const BottomNavigationRoute());
        }
        else  if(state.splashStatus.isUserNotLoggedIn){
          context.read<SplashBloc>().add(const SplashEvent.checkIsFirstRun());
        } else  if(state.splashStatus.isFirstRun){
          context.pushRoute(const IntroPageRoute());
        } else  if(state.splashStatus.isNotFirstRun){
          context.pushRoute(const SignupPageRoute());
        }
      },
      builder: (context, state) {
        return BasePageWidget(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100.h,
              width: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: context.scheme().neutralsBorderDivider,
                  width: 1.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/app-logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Maze Composting',
              style: context.titleHeadline,
            ),
            SizedBox(
              height: 30.h,
            ),
            const Center(child: AppLoading()),
          ],
        ));
      },
    );
  }
}
