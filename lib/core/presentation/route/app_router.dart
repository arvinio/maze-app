import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/presentation/widget/bottom_navigation.dart';
import 'package:maze_app/feature/account_info/domain/entity/user_info.dart';
import 'package:maze_app/feature/account_info/presentation/view/account_details/account_details_page.dart';
import 'package:maze_app/feature/account_info/presentation/view/account_household_info/account_household_info_page.dart';
import 'package:maze_app/feature/account_info/presentation/view/account_notification/account_notification_page.dart';
import 'package:maze_app/feature/account_info/presentation/view/account_profile/account_profile_page.dart';
import 'package:maze_app/feature/account_info/presentation/view/welcome_account_setup_page.dart';
import 'package:maze_app/feature/auth/create_password/presentation/view/create_password_page.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';
import 'package:maze_app/feature/auth/signing_up/presentation/view/verification_code_page.dart';
import 'package:maze_app/feature/auth/login/presentation/view/login_page.dart';
import 'package:maze_app/feature/auth/login/presentation/view/welcome_page.dart';
import 'package:maze_app/feature/auth/signup/presentation/view/signup_page.dart';
import 'package:maze_app/feature/intro/presentation/view/intro_page.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/view/admin_article_page.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/view/article_page.dart';
import 'package:maze_app/feature/knowledge/presentation/bookmarks/view/bookmarks_page.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/view/knowledge_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route,Screen',)
@lazySingleton
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [

    AutoRoute(path: '/', page: IntroPageRoute.page),
    AutoRoute(path:'/SignupPage', page: SignupPageRoute.page),
    AutoRoute(path:'/VerificationCodePage', page: VerificationCodePageRoute.page),
    AutoRoute(path:'/LoginPage', page: LoginPageRoute.page),
    AutoRoute(path:'/WelcomePage', page: WelcomePageRoute.page),
    AutoRoute(path:'/CreatePasswordPage', page: CreatePasswordPageRoute.page),
    AutoRoute(path:'/AccountDetailsPage', page: AccountDetailsPageRoute.page),
    AutoRoute(path:'/AccountProfilePage', page: AccountProfilePageRoute.page),
    AutoRoute(path:'/AccountNotificationPage', page: AccountNotificationPageRoute.page),
    AutoRoute(path:'/AccountHouseholdInfoPage', page: AccountHouseholdInfoPageRoute.page),
    AutoRoute(path:'/WelcomeAccountSetupPage', page: WelcomeAccountSetupPageRoute.page),
    AutoRoute(path: '/HomePage', page: BottomNavigationRoute.page),
    AutoRoute(path: '/ArticlePage', page: ArticlePageRoute.page),
    AutoRoute(path: '/BookmarkPage', page: BookmarksPageRoute.page),
  ];
}