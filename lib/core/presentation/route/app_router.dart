import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/versioning/presentation/versioning_page.dart';
import 'package:maze_app/feature/auth/pre_login/presentation/view/pre_login_page.dart';
import 'package:maze_app/feature/auth/signing_up/presentation/view/verification_code_page.dart';
import 'package:maze_app/feature/auth/account_creation/presentation/view/account_creation_page.dart';
import 'package:maze_app/feature/auth/login/presentation/view/login_page.dart';
import 'package:maze_app/feature/auth/login/presentation/view/welcome_page.dart';
import 'package:maze_app/feature/auth/forgot_password/presentation/view/forgot_password_page.dart';
import 'package:maze_app/feature/knowledge/home/presentation/view/home_page.dart';

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
    AutoRoute(path:'/VersioningPage', page: VersioningPageRoute.page),
    //AutoRoute(path:'/PreLoginPage', page: PreLoginPageRoute.page)
    AutoRoute(path:'/', page: PreLoginPageRoute.page),
    AutoRoute(path:'/VerificationCodePage', page: VerificationCodePageRoute.page),
    AutoRoute(path:'/AccountCreationPage', page: AccountCreationPageRoute.page),
    AutoRoute(path:'/LoginPage', page: LoginPageRoute.page),
    AutoRoute(path:'/ForgotPasswordPage', page: ForgotPasswordPageRoute.page),
    AutoRoute(path:'/WelcomePage', page: WelcomePageRoute.page),
    AutoRoute(path:'/HomePage', page: HomePageRoute.page),

  ];
}