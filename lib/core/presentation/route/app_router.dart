import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/presentation/widget/bottom_navigation.dart';
import 'package:maze_app/feature/auth/create_password/presentation/view/create_password_page.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';
import 'package:maze_app/feature/auth/signing_up/presentation/view/verification_code_page.dart';
import 'package:maze_app/feature/auth/login/presentation/view/login_page.dart';
import 'package:maze_app/feature/auth/login/presentation/view/welcome_page.dart';
import 'package:maze_app/feature/auth/signup/presentation/view/signup_page.dart';
import 'package:maze_app/feature/intro/presentation/view/intro_page.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/view/article_page.dart';
import 'package:maze_app/feature/knowledge/presentation/bookmarks/view/bookmarks_page.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/view/knowledge_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route,Screen',
)
@lazySingleton
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    //AutoRoute(path:'/SignupPage', page: SignupPageRoute.page)
    AutoRoute(path: '/Signup', page: SignupPageRoute.page),
    AutoRoute(path: '/', page: IntroPageRoute.page),
    AutoRoute(
        path: '/VerificationCodePage', page: VerificationCodePageRoute.page),
    AutoRoute(path: '/LoginPage', page: LoginPageRoute.page),
    AutoRoute(path: '/WelcomePage', page: WelcomePageRoute.page),
    AutoRoute(path: '/CreatePasswordPage', page: CreatePasswordPageRoute.page),
    AutoRoute(path: '/HomePage', page: BottomNavigationRoute.page),
    AutoRoute(path: '/ArticlePage', page: ArticlePageRoute.page),
    AutoRoute(path: '/BookmarkPage', page: BookmarksPageRoute.page),
  ];
}
