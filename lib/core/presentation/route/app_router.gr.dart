// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountDetailsPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountDetailsPage(),
      );
    },
    AccountHouseholdInfoPageRoute.name: (routeData) {
      final args = routeData.argsAs<AccountHouseholdInfoPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AccountHouseholdInfoPage(
          key: args.key,
          userInfo: args.userInfo,
        )),
      );
    },
    AccountNotificationPageRoute.name: (routeData) {
      final args = routeData.argsAs<AccountNotificationPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AccountNotificationPage(
          key: args.key,
          userInfo: args.userInfo,
        ),
      );
    },
    AccountProfilePageRoute.name: (routeData) {
      final args = routeData.argsAs<AccountProfilePageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AccountProfilePage(
          key: args.key,
          userInfo: args.userInfo,
        ),
      );
    },
    AdminArticlePageRoute.name: (routeData) {
      final args = routeData.argsAs<AdminArticlePageRouteArgs>(
          orElse: () => const AdminArticlePageRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AdminArticlePage(
          key: args.key,
          article: args.article,
        )),
      );
    },
    ArticlePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ArticlePage()),
      );
    },
    BookmarksPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const BookmarksPage()),
      );
    },
    BottomNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const BottomNavigation()),
      );
    },
    CreatePasswordPageRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePasswordPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: CreatePasswordPage(
          key: args.key,
          entryMode: args.entryMode,
          email: args.email,
        )),
      );
    },
    IntroPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const IntroPage()),
      );
    },
    KnowledgePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const KnowledgePage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      final args = routeData.argsAs<LoginPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: LoginPage(
          key: args.key,
          userName: args.userName,
        )),
      );
    },
    SignupPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SignupPage()),
      );
    },
    VerificationCodePageRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationCodePageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: VerificationCodePage(
          key: args.key,
          userId: args.userId,
          userName: args.userName,
          entryMode: args.entryMode,
        )),
      );
    },
    WelcomeAccountSetupPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeAccountSetupPage(),
      );
    },
    WelcomePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [AccountDetailsPage]
class AccountDetailsPageRoute extends PageRouteInfo<void> {
  const AccountDetailsPageRoute({List<PageRouteInfo>? children})
      : super(
          AccountDetailsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountDetailsPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountHouseholdInfoPage]
class AccountHouseholdInfoPageRoute
    extends PageRouteInfo<AccountHouseholdInfoPageRouteArgs> {
  AccountHouseholdInfoPageRoute({
    Key? key,
    required UserInfo? userInfo,
    List<PageRouteInfo>? children,
  }) : super(
          AccountHouseholdInfoPageRoute.name,
          args: AccountHouseholdInfoPageRouteArgs(
            key: key,
            userInfo: userInfo,
          ),
          initialChildren: children,
        );

  static const String name = 'AccountHouseholdInfoPageRoute';

  static const PageInfo<AccountHouseholdInfoPageRouteArgs> page =
      PageInfo<AccountHouseholdInfoPageRouteArgs>(name);
}

class AccountHouseholdInfoPageRouteArgs {
  const AccountHouseholdInfoPageRouteArgs({
    this.key,
    required this.userInfo,
  });

  final Key? key;

  final UserInfo? userInfo;

  @override
  String toString() {
    return 'AccountHouseholdInfoPageRouteArgs{key: $key, userInfo: $userInfo}';
  }
}

/// generated route for
/// [AccountNotificationPage]
class AccountNotificationPageRoute
    extends PageRouteInfo<AccountNotificationPageRouteArgs> {
  AccountNotificationPageRoute({
    Key? key,
    required UserInfo? userInfo,
    List<PageRouteInfo>? children,
  }) : super(
          AccountNotificationPageRoute.name,
          args: AccountNotificationPageRouteArgs(
            key: key,
            userInfo: userInfo,
          ),
          initialChildren: children,
        );

  static const String name = 'AccountNotificationPageRoute';

  static const PageInfo<AccountNotificationPageRouteArgs> page =
      PageInfo<AccountNotificationPageRouteArgs>(name);
}

class AccountNotificationPageRouteArgs {
  const AccountNotificationPageRouteArgs({
    this.key,
    required this.userInfo,
  });

  final Key? key;

  final UserInfo? userInfo;

  @override
  String toString() {
    return 'AccountNotificationPageRouteArgs{key: $key, userInfo: $userInfo}';
  }
}

/// generated route for
/// [AccountProfilePage]
class AccountProfilePageRoute
    extends PageRouteInfo<AccountProfilePageRouteArgs> {
  AccountProfilePageRoute({
    Key? key,
    required UserInfo? userInfo,
    List<PageRouteInfo>? children,
  }) : super(
          AccountProfilePageRoute.name,
          args: AccountProfilePageRouteArgs(
            key: key,
            userInfo: userInfo,
          ),
          initialChildren: children,
        );

  static const String name = 'AccountProfilePageRoute';

  static const PageInfo<AccountProfilePageRouteArgs> page =
      PageInfo<AccountProfilePageRouteArgs>(name);
}

class AccountProfilePageRouteArgs {
  const AccountProfilePageRouteArgs({
    this.key,
    required this.userInfo,
  });

  final Key? key;

  final UserInfo? userInfo;

  @override
  String toString() {
    return 'AccountProfilePageRouteArgs{key: $key, userInfo: $userInfo}';
  }
}

/// generated route for
/// [AdminArticlePage]
class AdminArticlePageRoute extends PageRouteInfo<AdminArticlePageRouteArgs> {
  AdminArticlePageRoute({
    Key? key,
    Article? article,
    List<PageRouteInfo>? children,
  }) : super(
          AdminArticlePageRoute.name,
          args: AdminArticlePageRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminArticlePageRoute';

  static const PageInfo<AdminArticlePageRouteArgs> page =
      PageInfo<AdminArticlePageRouteArgs>(name);
}

class AdminArticlePageRouteArgs {
  const AdminArticlePageRouteArgs({
    this.key,
    this.article,
  });

  final Key? key;

  final Article? article;

  @override
  String toString() {
    return 'AdminArticlePageRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [ArticlePage]
class ArticlePageRoute extends PageRouteInfo<void> {
  const ArticlePageRoute({List<PageRouteInfo>? children})
      : super(
          ArticlePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticlePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookmarksPage]
class BookmarksPageRoute extends PageRouteInfo<void> {
  const BookmarksPageRoute({List<PageRouteInfo>? children})
      : super(
          BookmarksPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarksPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BottomNavigation]
class BottomNavigationRoute extends PageRouteInfo<void> {
  const BottomNavigationRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreatePasswordPage]
class CreatePasswordPageRoute
    extends PageRouteInfo<CreatePasswordPageRouteArgs> {
  CreatePasswordPageRoute({
    Key? key,
    required EntryMode entryMode,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          CreatePasswordPageRoute.name,
          args: CreatePasswordPageRouteArgs(
            key: key,
            entryMode: entryMode,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'CreatePasswordPageRoute';

  static const PageInfo<CreatePasswordPageRouteArgs> page =
      PageInfo<CreatePasswordPageRouteArgs>(name);
}

class CreatePasswordPageRouteArgs {
  const CreatePasswordPageRouteArgs({
    this.key,
    required this.entryMode,
    required this.email,
  });

  final Key? key;

  final EntryMode entryMode;

  final String email;

  @override
  String toString() {
    return 'CreatePasswordPageRouteArgs{key: $key, entryMode: $entryMode, email: $email}';
  }
}

/// generated route for
/// [IntroPage]
class IntroPageRoute extends PageRouteInfo<void> {
  const IntroPageRoute({List<PageRouteInfo>? children})
      : super(
          IntroPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [KnowledgePage]
class KnowledgePageRoute extends PageRouteInfo<void> {
  const KnowledgePageRoute({List<PageRouteInfo>? children})
      : super(
          KnowledgePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'KnowledgePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginPageRoute extends PageRouteInfo<LoginPageRouteArgs> {
  LoginPageRoute({
    Key? key,
    required String userName,
    List<PageRouteInfo>? children,
  }) : super(
          LoginPageRoute.name,
          args: LoginPageRouteArgs(
            key: key,
            userName: userName,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const PageInfo<LoginPageRouteArgs> page =
      PageInfo<LoginPageRouteArgs>(name);
}

class LoginPageRouteArgs {
  const LoginPageRouteArgs({
    this.key,
    required this.userName,
  });

  final Key? key;

  final String userName;

  @override
  String toString() {
    return 'LoginPageRouteArgs{key: $key, userName: $userName}';
  }
}

/// generated route for
/// [SignupPage]
class SignupPageRoute extends PageRouteInfo<void> {
  const SignupPageRoute({List<PageRouteInfo>? children})
      : super(
          SignupPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerificationCodePage]
class VerificationCodePageRoute
    extends PageRouteInfo<VerificationCodePageRouteArgs> {
  VerificationCodePageRoute({
    Key? key,
    required String userId,
    required String userName,
    required EntryMode entryMode,
    List<PageRouteInfo>? children,
  }) : super(
          VerificationCodePageRoute.name,
          args: VerificationCodePageRouteArgs(
            key: key,
            userId: userId,
            userName: userName,
            entryMode: entryMode,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationCodePageRoute';

  static const PageInfo<VerificationCodePageRouteArgs> page =
      PageInfo<VerificationCodePageRouteArgs>(name);
}

class VerificationCodePageRouteArgs {
  const VerificationCodePageRouteArgs({
    this.key,
    required this.userId,
    required this.userName,
    required this.entryMode,
  });

  final Key? key;

  final String userId;

  final String userName;

  final EntryMode entryMode;

  @override
  String toString() {
    return 'VerificationCodePageRouteArgs{key: $key, userId: $userId, userName: $userName, entryMode: $entryMode}';
  }
}

/// generated route for
/// [WelcomeAccountSetupPage]
class WelcomeAccountSetupPageRoute extends PageRouteInfo<void> {
  const WelcomeAccountSetupPageRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeAccountSetupPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeAccountSetupPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomePage]
class WelcomePageRoute extends PageRouteInfo<void> {
  const WelcomePageRoute({List<PageRouteInfo>? children})
      : super(
          WelcomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
