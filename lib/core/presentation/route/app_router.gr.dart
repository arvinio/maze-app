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
    AboutPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutPage(),
      );
    },
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
    AccountSettingsPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AccountSettingsPage()),
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
    BinDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<BinDetailsPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BinDetailsPage(
          key: args.key,
          bin: args.bin,
          entries: args.entries,
        ),
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
    ChangePasswordPageRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ChangePasswordPage(
          key: args.key,
          email: args.email,
          currentPass: args.currentPass,
        )),
      );
    },
    ChatBotHomePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ChatBotHomePage()),
      );
    },
    ChatPageRoute.name: (routeData) {
      final args = routeData.argsAs<ChatPageRouteArgs>(
          orElse: () => const ChatPageRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ChatPage(
          key: args.key,
          chatId: args.chatId,
        )),
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
    CurrentPasswordPageRoute.name: (routeData) {
      final args = routeData.argsAs<CurrentPasswordPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: CurrentPasswordPage(
          key: args.key,
          email: args.email,
        )),
      );
    },
    EditProfilePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const EditProfilePage()),
      );
    },
    HelpCenterPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelpCenterPage(),
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
        child: WrappedRoute(child: const KnowledgePage()),
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
    NewEmailAddressPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const NewEmailAddressPage()),
      );
    },
    NewEntryPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewEntryPage(),
      );
    },
    ProfileHomePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileHomePage(),
      );
    },
    ReportPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ReportPage()),
      );
    },
    SignupPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SignupPage()),
      );
    },
    SplashLoadingPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SplashLoadingPage()),
      );
    },
    TrackerPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TrackerPage(),
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
      final args = routeData.argsAs<WelcomePageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WelcomePage(
          key: args.key,
          userName: args.userName,
          avatarUrl: args.avatarUrl,
        ),
      );
    },
    YourDetailsPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const YourDetailsPage()),
      );
    },
    YourHouseholdPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const YourHouseholdPage()),
      );
    },
  };
}

/// generated route for
/// [AboutPage]
class AboutPageRoute extends PageRouteInfo<void> {
  const AboutPageRoute({List<PageRouteInfo>? children})
      : super(
          AboutPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [AccountSettingsPage]
class AccountSettingsPageRoute extends PageRouteInfo<void> {
  const AccountSettingsPageRoute({List<PageRouteInfo>? children})
      : super(
          AccountSettingsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountSettingsPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [BinDetailsPage]
class BinDetailsPageRoute extends PageRouteInfo<BinDetailsPageRouteArgs> {
  BinDetailsPageRoute({
    Key? key,
    required Bin bin,
    required List<EditEntry> entries,
    List<PageRouteInfo>? children,
  }) : super(
          BinDetailsPageRoute.name,
          args: BinDetailsPageRouteArgs(
            key: key,
            bin: bin,
            entries: entries,
          ),
          initialChildren: children,
        );

  static const String name = 'BinDetailsPageRoute';

  static const PageInfo<BinDetailsPageRouteArgs> page =
      PageInfo<BinDetailsPageRouteArgs>(name);
}

class BinDetailsPageRouteArgs {
  const BinDetailsPageRouteArgs({
    this.key,
    required this.bin,
    required this.entries,
  });

  final Key? key;

  final Bin bin;

  final List<EditEntry> entries;

  @override
  String toString() {
    return 'BinDetailsPageRouteArgs{key: $key, bin: $bin, entries: $entries}';
  }
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
/// [ChangePasswordPage]
class ChangePasswordPageRoute
    extends PageRouteInfo<ChangePasswordPageRouteArgs> {
  ChangePasswordPageRoute({
    Key? key,
    required String email,
    required String currentPass,
    List<PageRouteInfo>? children,
  }) : super(
          ChangePasswordPageRoute.name,
          args: ChangePasswordPageRouteArgs(
            key: key,
            email: email,
            currentPass: currentPass,
          ),
          initialChildren: children,
        );

  static const String name = 'ChangePasswordPageRoute';

  static const PageInfo<ChangePasswordPageRouteArgs> page =
      PageInfo<ChangePasswordPageRouteArgs>(name);
}

class ChangePasswordPageRouteArgs {
  const ChangePasswordPageRouteArgs({
    this.key,
    required this.email,
    required this.currentPass,
  });

  final Key? key;

  final String email;

  final String currentPass;

  @override
  String toString() {
    return 'ChangePasswordPageRouteArgs{key: $key, email: $email, currentPass: $currentPass}';
  }
}

/// generated route for
/// [ChatBotHomePage]
class ChatBotHomePageRoute extends PageRouteInfo<void> {
  const ChatBotHomePageRoute({List<PageRouteInfo>? children})
      : super(
          ChatBotHomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatBotHomePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatPage]
class ChatPageRoute extends PageRouteInfo<ChatPageRouteArgs> {
  ChatPageRoute({
    Key? key,
    String? chatId,
    List<PageRouteInfo>? children,
  }) : super(
          ChatPageRoute.name,
          args: ChatPageRouteArgs(
            key: key,
            chatId: chatId,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatPageRoute';

  static const PageInfo<ChatPageRouteArgs> page =
      PageInfo<ChatPageRouteArgs>(name);
}

class ChatPageRouteArgs {
  const ChatPageRouteArgs({
    this.key,
    this.chatId,
  });

  final Key? key;

  final String? chatId;

  @override
  String toString() {
    return 'ChatPageRouteArgs{key: $key, chatId: $chatId}';
  }
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
/// [CurrentPasswordPage]
class CurrentPasswordPageRoute
    extends PageRouteInfo<CurrentPasswordPageRouteArgs> {
  CurrentPasswordPageRoute({
    Key? key,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          CurrentPasswordPageRoute.name,
          args: CurrentPasswordPageRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'CurrentPasswordPageRoute';

  static const PageInfo<CurrentPasswordPageRouteArgs> page =
      PageInfo<CurrentPasswordPageRouteArgs>(name);
}

class CurrentPasswordPageRouteArgs {
  const CurrentPasswordPageRouteArgs({
    this.key,
    required this.email,
  });

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'CurrentPasswordPageRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [EditProfilePage]
class EditProfilePageRoute extends PageRouteInfo<void> {
  const EditProfilePageRoute({List<PageRouteInfo>? children})
      : super(
          EditProfilePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfilePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HelpCenterPage]
class HelpCenterPageRoute extends PageRouteInfo<void> {
  const HelpCenterPageRoute({List<PageRouteInfo>? children})
      : super(
          HelpCenterPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpCenterPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [NewEmailAddressPage]
class NewEmailAddressPageRoute extends PageRouteInfo<void> {
  const NewEmailAddressPageRoute({List<PageRouteInfo>? children})
      : super(
          NewEmailAddressPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewEmailAddressPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewEntryPage]
class NewEntryPageRoute extends PageRouteInfo<void> {
  const NewEntryPageRoute({List<PageRouteInfo>? children})
      : super(
          NewEntryPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewEntryPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileHomePage]
class ProfileHomePageRoute extends PageRouteInfo<void> {
  const ProfileHomePageRoute({List<PageRouteInfo>? children})
      : super(
          ProfileHomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileHomePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportPage]
class ReportPageRoute extends PageRouteInfo<void> {
  const ReportPageRoute({List<PageRouteInfo>? children})
      : super(
          ReportPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [SplashLoadingPage]
class SplashLoadingPageRoute extends PageRouteInfo<void> {
  const SplashLoadingPageRoute({List<PageRouteInfo>? children})
      : super(
          SplashLoadingPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashLoadingPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TrackerPage]
class TrackerPageRoute extends PageRouteInfo<void> {
  const TrackerPageRoute({List<PageRouteInfo>? children})
      : super(
          TrackerPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrackerPageRoute';

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
class WelcomePageRoute extends PageRouteInfo<WelcomePageRouteArgs> {
  WelcomePageRoute({
    Key? key,
    required String? userName,
    required String? avatarUrl,
    List<PageRouteInfo>? children,
  }) : super(
          WelcomePageRoute.name,
          args: WelcomePageRouteArgs(
            key: key,
            userName: userName,
            avatarUrl: avatarUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'WelcomePageRoute';

  static const PageInfo<WelcomePageRouteArgs> page =
      PageInfo<WelcomePageRouteArgs>(name);
}

class WelcomePageRouteArgs {
  const WelcomePageRouteArgs({
    this.key,
    required this.userName,
    required this.avatarUrl,
  });

  final Key? key;

  final String? userName;

  final String? avatarUrl;

  @override
  String toString() {
    return 'WelcomePageRouteArgs{key: $key, userName: $userName, avatarUrl: $avatarUrl}';
  }
}

/// generated route for
/// [YourDetailsPage]
class YourDetailsPageRoute extends PageRouteInfo<void> {
  const YourDetailsPageRoute({List<PageRouteInfo>? children})
      : super(
          YourDetailsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'YourDetailsPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [YourHouseholdPage]
class YourHouseholdPageRoute extends PageRouteInfo<void> {
  const YourHouseholdPageRoute({List<PageRouteInfo>? children})
      : super(
          YourHouseholdPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'YourHouseholdPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
