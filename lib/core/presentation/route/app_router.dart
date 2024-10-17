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
import 'package:maze_app/feature/auth/login/presentation/view/login_page.dart';
import 'package:maze_app/feature/auth/login/presentation/view/welcome_page.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';
import 'package:maze_app/feature/auth/signing_up/presentation/view/verification_code_page.dart';
import 'package:maze_app/feature/auth/signup/presentation/view/signup_page.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chat/presentation/view/chat_page.dart';
import 'package:maze_app/feature/chatbot/presentation/view/chatBot_home_page.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/presentation/view/community_home_page.dart';
import 'package:maze_app/feature/community/presentation/view/search_community/presentation/view/search_community_page.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/view_community_page.dart';
import 'package:maze_app/feature/community/presentation/view/view_post/presentation/view/view_post_page.dart';
import 'package:maze_app/feature/intro/presentation/view/intro_page.dart';
import 'package:maze_app/feature/intro/presentation/view/splash_loading_page.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/presentation/article/view/article_page.dart';
import 'package:maze_app/feature/knowledge/presentation/bookmarks/view/bookmarks_page.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/view/admin_article_page.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/view/knowledge_page.dart';
import 'package:maze_app/feature/profile/presentation/view/about/about_page.dart';
import 'package:maze_app/feature/profile/presentation/view/account_settings/account_settings_page.dart';
import 'package:maze_app/feature/profile/presentation/view/change_password/change_password_page.dart';
import 'package:maze_app/feature/profile/presentation/view/change_password/current_password_page.dart';
import 'package:maze_app/feature/profile/presentation/view/edit_profile/presentation/view/edit_profile_page.dart';
import 'package:maze_app/feature/profile/presentation/view/help_center/help_center_page.dart';
import 'package:maze_app/feature/profile/presentation/view/new_email_address/new_email_address_page.dart';
import 'package:maze_app/feature/profile/presentation/view/profile_home_page.dart';
import 'package:maze_app/feature/profile/presentation/view/report/presentation/view/report_page.dart';
import 'package:maze_app/feature/profile/presentation/view/your_details/your_details_page.dart';
import 'package:maze_app/feature/profile/presentation/view/your_household/your_household_page.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin_chart_data.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';
import 'package:maze_app/feature/tracker/presentation/view/bin_details_page.dart';
import 'package:maze_app/feature/tracker/presentation/view/new_entry_page.dart';
import 'package:maze_app/feature/tracker/presentation/view/tracker_page.dart';


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
    AutoRoute(path: '/', page: SplashLoadingPageRoute.page),
    AutoRoute(path: '/IntroPage', page: IntroPageRoute.page),
    AutoRoute(path: '/SignupPage', page: SignupPageRoute.page),
    AutoRoute(
        path: '/VerificationCodePage', page: VerificationCodePageRoute.page),
    AutoRoute(path: '/LoginPage', page: LoginPageRoute.page),
    AutoRoute(path: '/WelcomePage', page: WelcomePageRoute.page),
    AutoRoute(path: '/CreatePasswordPage', page: CreatePasswordPageRoute.page),
    AutoRoute(path: '/AccountDetailsPage', page: AccountDetailsPageRoute.page),
    AutoRoute(path: '/AccountProfilePage', page: AccountProfilePageRoute.page),
    AutoRoute(
        path: '/AccountNotificationPage',
        page: AccountNotificationPageRoute.page),
    AutoRoute(
        path: '/AccountHouseholdInfoPage',
        page: AccountHouseholdInfoPageRoute.page),
    AutoRoute(
        path: '/WelcomeAccountSetupPage',
        page: WelcomeAccountSetupPageRoute.page),
    AutoRoute(path: '/HomePage', page: BottomNavigationRoute.page),
    AutoRoute(path: '/ArticlePage', page: ArticlePageRoute.page),
    AutoRoute(path: '/BookmarkPage', page: BookmarksPageRoute.page),
    AutoRoute(path: '/AdminArticlePage', page: AdminArticlePageRoute.page),
    AutoRoute(path: '/ProfileHomePage', page: ProfileHomePageRoute.page),
    AutoRoute(path: '/HelpCenterPage', page: HelpCenterPageRoute.page),
    AutoRoute(path: '/AboutPage', page: AboutPageRoute.page),
    AutoRoute(
        path: '/AccountSettingsPage', page: AccountSettingsPageRoute.page),
    AutoRoute(
        path: '/NewEmailAddressPage', page: NewEmailAddressPageRoute.page),
    AutoRoute(path: '/ReportPage', page: ReportPageRoute.page),
    AutoRoute(path: '/YourDetailsPage', page: YourDetailsPageRoute.page),
    AutoRoute(path: '/EditProfilePage', page: EditProfilePageRoute.page),
    AutoRoute(path: '/YourHouseholdPage', page: YourHouseholdPageRoute.page),
    AutoRoute(path: '/ChangePasswordPage', page: ChangePasswordPageRoute.page),
    AutoRoute(
        path: '/CurrentPasswordPage', page: CurrentPasswordPageRoute.page),
    AutoRoute(path: '/ChatBotHomePage', page: ChatBotHomePageRoute.page),
    AutoRoute(path: '/ChatPage', page: ChatPageRoute.page),
    AutoRoute(path: '/BinDetailsPage', page: BinDetailsPageRoute.page),
    AutoRoute(path: '/NewEntryPage', page: NewEntryPageRoute.page),
    AutoRoute(path: '/CommunityHomePage', page: CommunityHomePageRoute.page),
    AutoRoute(
        path: '/ViewCommunityPage/:communityId',
        page: ViewCommunityPageRoute.page),
    AutoRoute(path: '/ViewPostPage', page: ViewPostPageRoute.page),
    CustomRoute(
      path: '/CommunityHomePage/Search',
      page: SearchCommunityPageRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
      // To disable the previous page fade out transition!
      fullscreenDialog: true,
      // Although this route's TransitionsBuilders is noTransition,
      // it needs to be set for hero animation to work! so this is the hero animation duration
      durationInMilliseconds: 350,
      reverseDurationInMilliseconds: 350,
    )
  ];
}
