import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/presentation/widget/app_loading.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/intro/presentation/cubit/intro_cubit.dart';

@RoutePage()
class SplashLoadingPage extends StatefulWidget implements AutoRouteWrapper {
  const SplashLoadingPage({super.key});

  @override
  State<SplashLoadingPage> createState() => _SplashLoadingPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<IntroCubit>(), child: this);
  }
}

class _SplashLoadingPageState extends State<SplashLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroCubit, IntroState>(
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
