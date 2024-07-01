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
          code: args.code,
          entryMode: args.entryMode,
        )),
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
    required String code,
    required EntryMode entryMode,
    List<PageRouteInfo>? children,
  }) : super(
          VerificationCodePageRoute.name,
          args: VerificationCodePageRouteArgs(
            key: key,
            userId: userId,
            userName: userName,
            code: code,
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
    required this.code,
    required this.entryMode,
  });

  final Key? key;

  final String userId;

  final String userName;

  final String code;

  final EntryMode entryMode;

  @override
  String toString() {
    return 'VerificationCodePageRouteArgs{key: $key, userId: $userId, userName: $userName, code: $code, entryMode: $entryMode}';
  }
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
