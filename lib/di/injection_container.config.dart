// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:maze_app/core/config/assets/assets.dart' as _i253;
import 'package:maze_app/core/config/strings.dart' as _i713;
import 'package:maze_app/core/local/setting_manager.dart' as _i283;
import 'package:maze_app/core/local/user/user_manager.dart' as _i547;
import 'package:maze_app/core/network/dio_caller.dart' as _i874;
import 'package:maze_app/core/network/util/expire_token_interceptor.dart'
    as _i198;
import 'package:maze_app/core/presentation/route/app_router.dart' as _i112;
import 'package:maze_app/core/style/app_color.dart' as _i751;
import 'package:maze_app/core/style/app_theme.dart' as _i283;
import 'package:maze_app/core/util/app_log.dart' as _i234;
import 'package:maze_app/core/util/crypto/encrypt_helper.dart' as _i1014;
import 'package:maze_app/core/util/shared_preferences_helper.dart' as _i1055;
import 'package:maze_app/data_provider/refresh_token/data/data_source/token_remote_data_source.dart'
    as _i494;
import 'package:maze_app/data_provider/refresh_token/data/repository/token_repository_impl.dart'
    as _i179;
import 'package:maze_app/data_provider/refresh_token/domain/token_repository.dart'
    as _i278;
import 'package:maze_app/data_provider/refresh_token/token_manager.dart'
    as _i265;
import 'package:maze_app/di/injection_container.dart' as _i825;
import 'package:maze_app/feature/account_info/data/data_source/account_info_remote_data_source.dart'
    as _i253;
import 'package:maze_app/feature/account_info/data/data_source/account_info_remote_data_source_impl.dart'
    as _i501;
import 'package:maze_app/feature/account_info/data/repository/account_info_repository_impl.dart'
    as _i197;
import 'package:maze_app/feature/account_info/domain/entity/user_info.dart'
    as _i735;
import 'package:maze_app/feature/account_info/domain/repository/account_info_repository.dart'
    as _i691;
import 'package:maze_app/feature/account_info/presentation/bloc/account_info_bloc.dart'
    as _i613;
import 'package:maze_app/feature/auth/create_password/data/data_source/create_password_remote_data_source.dart'
    as _i19;
import 'package:maze_app/feature/auth/create_password/data/data_source/create_password_remote_data_source_impl.dart'
    as _i75;
import 'package:maze_app/feature/auth/create_password/data/repository/create_password_repository_impl.dart'
    as _i679;
import 'package:maze_app/feature/auth/create_password/domain/repository/create_password_repository.dart'
    as _i16;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/data_source/forgot_pass_remote_data_source.dart'
    as _i1046;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/data_source/forgot_pass_remote_data_source_impl.dart'
    as _i23;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/repository/forgot_pass_repository_impl.dart'
    as _i404;
import 'package:maze_app/feature/auth/create_password/forgot_password/domain/repository/forgot_pass_repository.dart'
    as _i557;
import 'package:maze_app/feature/auth/create_password/forgot_password/presentation/bloc/forgot_pass_bloc.dart'
    as _i507;
import 'package:maze_app/feature/auth/create_password/presentation/bloc/create_pass_bloc.dart'
    as _i1008;
import 'package:maze_app/feature/auth/login/data/data_source/login_remote_data_source.dart'
    as _i635;
import 'package:maze_app/feature/auth/login/data/data_source/login_remote_data_source_impl.dart'
    as _i410;
import 'package:maze_app/feature/auth/login/data/repository/login_repository_impl.dart'
    as _i720;
import 'package:maze_app/feature/auth/login/domain/repository/login_repository.dart'
    as _i268;
import 'package:maze_app/feature/auth/login/presentation/bloc/login_bloc.dart'
    as _i263;
import 'package:maze_app/feature/auth/signing_up/data/data_source/verify_remote_data_source.dart'
    as _i557;
import 'package:maze_app/feature/auth/signing_up/data/data_source/verify_remote_data_source_impl.dart'
    as _i793;
import 'package:maze_app/feature/auth/signing_up/data/repository/verify_repository_impl.dart'
    as _i889;
import 'package:maze_app/feature/auth/signing_up/domain/repository/verify_repository.dart'
    as _i1006;
import 'package:maze_app/feature/auth/signing_up/presentation/bloc/verify_bloc.dart'
    as _i406;
import 'package:maze_app/feature/auth/signup/data/data_source/signup_remote_data_source.dart'
    as _i88;
import 'package:maze_app/feature/auth/signup/data/data_source/signup_remote_data_source_impl.dart'
    as _i893;
import 'package:maze_app/feature/auth/signup/data/repository/signup_repository_impl.dart'
    as _i145;
import 'package:maze_app/feature/auth/signup/domain/repository/signup_repository.dart'
    as _i468;
import 'package:maze_app/feature/auth/signup/presentation/bloc/signup_bloc.dart'
    as _i118;
import 'package:maze_app/feature/chatbot/data/data_source/chatbot_remote_data_source.dart'
    as _i211;
import 'package:maze_app/feature/chatbot/data/data_source/chatbot_remote_data_source_impl.dart'
    as _i277;
import 'package:maze_app/feature/chatbot/data/repository/chatbot_repository_impl.dart'
    as _i589;
import 'package:maze_app/feature/chatbot/domain/repository/chatbot_repository.dart'
    as _i529;
import 'package:maze_app/feature/chatbot/presentation/bloc/chat_bot_bloc.dart'
    as _i726;
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/data_source/chat_remote_data_source.dart'
    as _i1033;
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/data_source/chat_remote_data_source_impl.dart'
    as _i324;
import 'package:maze_app/feature/chatbot/presentation/view/chat/data/repository/chat_repository_impl.dart'
    as _i586;
import 'package:maze_app/feature/chatbot/presentation/view/chat/domain/repository/chat_repository.dart'
    as _i63;
import 'package:maze_app/feature/chatbot/presentation/view/chat/presentation/bloc/chat_bloc.dart'
    as _i358;
import 'package:maze_app/feature/chatbot/presentation/view/faq/presentation/bloc/faq_bloc.dart'
    as _i411;
import 'package:maze_app/feature/community/data/data_source/community_remote_data_source.dart'
    as _i1061;
import 'package:maze_app/feature/community/data/data_source/community_remote_data_source_impl.dart'
    as _i1024;
import 'package:maze_app/feature/community/data/repository/community_repository_impl.dart'
    as _i91;
import 'package:maze_app/feature/community/domain/repository/community_repository.dart'
    as _i343;
import 'package:maze_app/feature/community/presentation/bloc/community_bloc.dart'
    as _i186;
import 'package:maze_app/feature/community/presentation/view/create_community/presention/bloc/create_community_bloc.dart'
    as _i245;
import 'package:maze_app/feature/community/presentation/view/create_post/presentation/bloc/create_post_bloc.dart'
    as _i16;
import 'package:maze_app/feature/community/presentation/view/search_community/presentation/bloc/search_community_bloc.dart'
    as _i314;
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/bloc/view_community_bloc.dart'
    as _i1011;
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/community_leaderboard/bloc/community_leaderboard_bloc.dart'
    as _i148;
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/view/community_post/bloc/community_post_bloc.dart'
    as _i833;
import 'package:maze_app/feature/intro/data/datasource/intro_local_datasource.dart'
    as _i191;
import 'package:maze_app/feature/intro/data/repo/intro_repo_impl.dart' as _i202;
import 'package:maze_app/feature/intro/domain/repo/intro_repo.dart' as _i178;
import 'package:maze_app/feature/intro/domain/usecase/get_is_first_run.dart'
    as _i351;
import 'package:maze_app/feature/intro/domain/usecase/set_is_first_run.dart'
    as _i847;
import 'package:maze_app/feature/intro/presentation/bloc/splash_bloc.dart'
    as _i1072;
import 'package:maze_app/feature/knowledge/data/datasource/knowledge_remote_datasource.dart'
    as _i66;
import 'package:maze_app/feature/knowledge/data/repo/knowledge_repo_impl.dart'
    as _i226;
import 'package:maze_app/feature/knowledge/domain/repo/knowledge_repo.dart'
    as _i490;
import 'package:maze_app/feature/knowledge/domain/usecase/create_article.dart'
    as _i575;
import 'package:maze_app/feature/knowledge/domain/usecase/delete_article.dart'
    as _i657;
import 'package:maze_app/feature/knowledge/domain/usecase/edit_article.dart'
    as _i976;
import 'package:maze_app/feature/knowledge/domain/usecase/get_article.dart'
    as _i41;
import 'package:maze_app/feature/knowledge/domain/usecase/get_articles.dart'
    as _i885;
import 'package:maze_app/feature/knowledge/domain/usecase/get_bookmarks.dart'
    as _i507;
import 'package:maze_app/feature/knowledge/domain/usecase/get_categories.dart'
    as _i375;
import 'package:maze_app/feature/knowledge/domain/usecase/remove_bookmark.dart'
    as _i1021;
import 'package:maze_app/feature/knowledge/domain/usecase/search_articles.dart'
    as _i754;
import 'package:maze_app/feature/knowledge/domain/usecase/set_bookmark.dart'
    as _i672;
import 'package:maze_app/feature/knowledge/presentation/article/cubit/article_cubit.dart'
    as _i591;
import 'package:maze_app/feature/knowledge/presentation/bookmarks/cubit/bookmarks_cubit.dart'
    as _i888;
import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart'
    as _i827;
import 'package:maze_app/feature/profile/data/data_source/profile_remote_data_source.dart'
    as _i392;
import 'package:maze_app/feature/profile/data/data_source/profile_remote_data_source_impl.dart'
    as _i1052;
import 'package:maze_app/feature/profile/data/repository/profile_repository_impl.dart'
    as _i26;
import 'package:maze_app/feature/profile/domain/repository/profile_repository.dart'
    as _i30;
import 'package:maze_app/feature/profile/presentation/bloc/profile_bloc.dart'
    as _i491;
import 'package:maze_app/feature/profile/presentation/view/report/data/data_source/report_remote_data_source.dart'
    as _i17;
import 'package:maze_app/feature/profile/presentation/view/report/data/data_source/report_remote_data_source_impl.dart'
    as _i573;
import 'package:maze_app/feature/profile/presentation/view/report/data/repository/report_repository_impl.dart'
    as _i468;
import 'package:maze_app/feature/profile/presentation/view/report/domain/repository/report_repository.dart'
    as _i675;
import 'package:maze_app/feature/profile/presentation/view/report/presentation/bloc/report_bloc.dart'
    as _i334;
import 'package:maze_app/feature/tracker/data/datasource/tracker_remote_data_source.dart'
    as _i446;
import 'package:maze_app/feature/tracker/data/datasource/tracker_remote_data_source_impl.dart'
    as _i596;
import 'package:maze_app/feature/tracker/data/repo/tracker_repo_impl.dart'
    as _i536;
import 'package:maze_app/feature/tracker/domain/repo/tracker_repo.dart'
    as _i1012;
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart'
    as _i566;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i528.PrettyDioLogger>(() => networkModule.prettyDioLogger);
    gh.lazySingleton<_i974.Logger>(() => networkModule.logger);
    gh.lazySingleton<_i1014.EncryptHelper>(() => _i1014.EncryptHelper());
    gh.lazySingleton<_i713.StringsBase>(() => _i713.StringsBase());
    gh.lazySingleton<_i253.AssetsBase>(() => _i253.AssetsBase());
    gh.lazySingleton<_i751.AppColorsBase>(() => _i751.AppColorsBase());
    gh.lazySingleton<_i112.AppRouter>(() => _i112.AppRouter());
    gh.lazySingleton<_i735.UserInfo>(() => _i735.UserInfo());
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.provideMazeDio(gh<_i528.PrettyDioLogger>()),
      instanceName: 'versioning0',
    );
    gh.lazySingleton<_i198.ExpireTokenInterceptor>(
        () => _i198.ExpireTokenInterceptor(gh<_i1014.EncryptHelper>()));
    gh.lazySingleton<_i234.AppLog>(() => _i234.AppLog(gh<_i974.Logger>()));
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.provideTokenDio(gh<_i528.PrettyDioLogger>()),
      instanceName: 'token',
    );
    gh.lazySingleton<_i874.DioCaller>(
      () => networkModule
          .provideTokenDioCaller(gh<_i361.Dio>(instanceName: 'token')),
      instanceName: 'token',
    );
    gh.lazySingleton<_i874.DioCaller>(
      () => networkModule
          .provideMazeDioCaller(gh<_i361.Dio>(instanceName: 'versioning0')),
      instanceName: 'versioning0',
    );
    gh.factory<_i1055.SharedPreferencesHelper>(() =>
        _i1055.SharedPreferencesHelper(
            encryptHelper: gh<_i1014.EncryptHelper>()));
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.provideBaseDio(gh<_i528.PrettyDioLogger>()),
      instanceName: 'maze',
    );
    gh.factory<_i19.CreatePasswordRemoteDataSource>(() =>
        _i75.CreatePasswordRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'token')));
    gh.factory<_i211.ChatBotRemoteRemoteDataSource>(() =>
        _i277.ChatBotRemoteRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'token')));
    gh.factory<_i17.ReportRemoteDataSource>(() =>
        _i573.ReportRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'token')));
    gh.factory<_i1033.ChatRemoteRemoteDataSource>(() =>
        _i324.ChatBotRemoteRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'token')));
    gh.factory<_i392.ProfileRemoteDataSource>(() =>
        _i1052.ProfileRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'token')));
    gh.factory<_i66.KnowledgeRemoteDatasource>(() =>
        _i66.KnowledgeRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'token')));
    gh.factory<_i490.KnowledgeRepo>(() => _i226.KnowledgeRepoImpl(
        remoteDatasource: gh<_i66.KnowledgeRemoteDatasource>()));
    gh.factory<_i283.SettingsManager>(
        () => _i283.SettingsManager(gh<_i1055.SharedPreferencesHelper>()));
    gh.factory<_i253.AccountInfoRemoteRemoteDataSource>(() =>
        _i501.AccountInfoRemoteRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'token')));
    gh.factory<_i1061.CommunityRemoteDataSource>(() =>
        _i1024.CommunityRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'token')));
    gh.factory<_i283.AppTheme>(
        () => _i283.AppTheme(appColors: gh<_i751.AppColorsBase>()));
    gh.factory<_i675.ReportRepository>(
        () => _i468.ReportRepositoryImpl(gh<_i17.ReportRemoteDataSource>()));
    gh.factory<_i446.TrackerRemoteDataSource>(() =>
        _i596.TrackerRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'token')));
    gh.factory<_i30.ProfileRepository>(
        () => _i26.ProfileRepositoryImpl(gh<_i392.ProfileRemoteDataSource>()));
    gh.factory<_i691.AccountInfoRepository>(() =>
        _i197.AccountInfoRepositoryImpl(
            gh<_i253.AccountInfoRemoteRemoteDataSource>()));
    gh.factory<_i672.SetBookmark>(
        () => _i672.SetBookmark(repo: gh<_i490.KnowledgeRepo>()));
    gh.factory<_i754.SearchArticles>(
        () => _i754.SearchArticles(repo: gh<_i490.KnowledgeRepo>()));
    gh.factory<_i375.GetCategories>(
        () => _i375.GetCategories(repo: gh<_i490.KnowledgeRepo>()));
    gh.factory<_i507.GetBookmarks>(
        () => _i507.GetBookmarks(repo: gh<_i490.KnowledgeRepo>()));
    gh.factory<_i575.CreateArticle>(
        () => _i575.CreateArticle(repo: gh<_i490.KnowledgeRepo>()));
    gh.factory<_i885.GetArticles>(
        () => _i885.GetArticles(repo: gh<_i490.KnowledgeRepo>()));
    gh.factory<_i41.GetArticle>(
        () => _i41.GetArticle(repo: gh<_i490.KnowledgeRepo>()));
    gh.factory<_i1021.RemoveBookmark>(
        () => _i1021.RemoveBookmark(repo: gh<_i490.KnowledgeRepo>()));
    gh.factory<_i657.DeleteArticle>(
        () => _i657.DeleteArticle(repo: gh<_i490.KnowledgeRepo>()));
    gh.factory<_i976.EditArticle>(
        () => _i976.EditArticle(repo: gh<_i490.KnowledgeRepo>()));
    gh.lazySingleton<_i547.UserManager>(
        () => _i547.UserManager(gh<_i283.SettingsManager>()));
    gh.lazySingleton<_i874.DioCaller>(
      () => networkModule
          .provideBaseDioCaller(gh<_i361.Dio>(instanceName: 'maze')),
      instanceName: 'maze',
    );
    gh.factory<_i491.ProfileBloc>(
        () => _i491.ProfileBloc(gh<_i30.ProfileRepository>()));
    gh.factory<_i591.ArticleCubit>(() => _i591.ArticleCubit(
          setBookmark: gh<_i672.SetBookmark>(),
          removeBookmark: gh<_i1021.RemoveBookmark>(),
          getArticle: gh<_i41.GetArticle>(),
          router: gh<_i112.AppRouter>(),
        ));
    gh.factory<_i635.LoginRemoteDataSource>(() =>
        _i410.LoginRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'maze')));
    gh.factory<_i1072.SplashBloc>(
        () => _i1072.SplashBloc(gh<_i547.UserManager>()));
    gh.factory<_i1012.TrackerRepo>(() => _i536.TrackerRepoImpl(
        trackerRemoteDataSource: gh<_i446.TrackerRemoteDataSource>()));
    gh.factory<_i343.CommunityRepository>(() =>
        _i91.CommunityRepositoryImpl(gh<_i1061.CommunityRemoteDataSource>()));
    gh.factory<_i1046.ForgotPassRemoteDataSource>(() =>
        _i23.ForgotPassRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'maze')));
    gh.factory<_i557.VerifyRemoteDataSource>(() =>
        _i793.VerifyRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'maze')));
    gh.factory<_i191.IntroLocalDatasource>(() => _i191.IntroLocalDatasourceImpl(
        helper: gh<_i1055.SharedPreferencesHelper>()));
    gh.factory<_i334.ReportBloc>(
        () => _i334.ReportBloc(gh<_i675.ReportRepository>()));
    gh.factory<_i613.AccountInfoBloc>(
        () => _i613.AccountInfoBloc(gh<_i691.AccountInfoRepository>()));
    gh.factory<_i529.CharBotRepository>(() =>
        _i589.CharBotRepositoryImpl(gh<_i211.ChatBotRemoteRemoteDataSource>()));
    gh.factory<_i557.ForgotPassRepository>(() => _i404.ForgotPassRepositoryImpl(
        gh<_i1046.ForgotPassRemoteDataSource>()));
    gh.factory<_i178.IntroRepo>(() =>
        _i202.IntroRepoImpl(datasource: gh<_i191.IntroLocalDatasource>()));
    gh.factory<_i888.BookmarksCubit>(() => _i888.BookmarksCubit(
          getBookmarks: gh<_i507.GetBookmarks>(),
          router: gh<_i112.AppRouter>(),
          removeBookmark: gh<_i1021.RemoveBookmark>(),
          setBookmark: gh<_i672.SetBookmark>(),
        ));
    gh.factory<_i16.CreatePasswordRepository>(() =>
        _i679.CreatePasswordRepositoryImpl(
            gh<_i19.CreatePasswordRemoteDataSource>()));
    gh.factory<_i63.ChatRepository>(() =>
        _i586.CharRepositoryImpl(gh<_i1033.ChatRemoteRemoteDataSource>()));
    gh.factory<_i1008.CreatePassBloc>(
        () => _i1008.CreatePassBloc(gh<_i16.CreatePasswordRepository>()));
    gh.factory<_i507.ForgotPassBloc>(
        () => _i507.ForgotPassBloc(gh<_i557.ForgotPassRepository>()));
    gh.factory<_i268.LoginRepository>(
        () => _i720.LoginRepositoryImpl(gh<_i635.LoginRemoteDataSource>()));
    gh.factory<_i1006.VerifyRepository>(
        () => _i889.VerifyRepositoryImpl(gh<_i557.VerifyRemoteDataSource>()));
    gh.factory<_i494.TokenRemoteDataSource>(() =>
        _i494.TokenRemoteDataSourceImpl(
            gh<_i874.DioCaller>(instanceName: 'maze')));
    gh.factory<_i406.VerifyBloc>(
        () => _i406.VerifyBloc(gh<_i1006.VerifyRepository>()));
    gh.factory<_i411.FaqBloc>(
        () => _i411.FaqBloc(gh<_i529.CharBotRepository>()));
    gh.factory<_i726.ChatBotBloc>(
        () => _i726.ChatBotBloc(gh<_i529.CharBotRepository>()));
    gh.factory<_i847.SetIsFirstRun>(
        () => _i847.SetIsFirstRun(repo: gh<_i178.IntroRepo>()));
    gh.factory<_i351.GetIsFirstRun>(
        () => _i351.GetIsFirstRun(repo: gh<_i178.IntroRepo>()));
    gh.factory<_i566.TrackerBloc>(
        () => _i566.TrackerBloc(gh<_i1012.TrackerRepo>()));
    gh.factory<_i827.KnowledgeCubit>(() => _i827.KnowledgeCubit(
          getArticles: gh<_i885.GetArticles>(),
          router: gh<_i112.AppRouter>(),
          searchArticles: gh<_i754.SearchArticles>(),
          getCategories: gh<_i375.GetCategories>(),
          setBookmark: gh<_i672.SetBookmark>(),
          removeBookmark: gh<_i1021.RemoveBookmark>(),
          getArticle: gh<_i41.GetArticle>(),
          createArticle: gh<_i575.CreateArticle>(),
          deleteArticle: gh<_i657.DeleteArticle>(),
          editArticle: gh<_i976.EditArticle>(),
        ));
    gh.factory<_i88.SignupRemoteDataSource>(() =>
        _i893.SignupRemoteDataSourceImpl(
            dioCaller: gh<_i874.DioCaller>(instanceName: 'maze')));
    gh.factory<_i245.CreateCommunityBloc>(
        () => _i245.CreateCommunityBloc(gh<_i343.CommunityRepository>()));
    gh.factory<_i16.CreatePostBloc>(
        () => _i16.CreatePostBloc(gh<_i343.CommunityRepository>()));
    gh.factory<_i1011.ViewCommunityBloc>(
        () => _i1011.ViewCommunityBloc(gh<_i343.CommunityRepository>()));
    gh.factory<_i186.CommunityBloc>(
        () => _i186.CommunityBloc(gh<_i343.CommunityRepository>()));
    gh.factory<_i314.SearchCommunityBloc>(
        () => _i314.SearchCommunityBloc(gh<_i343.CommunityRepository>()));
    gh.factory<_i833.CommunityPostBloc>(
        () => _i833.CommunityPostBloc(gh<_i343.CommunityRepository>()));
    gh.factory<_i148.CommunityLeaderboardBloc>(
        () => _i148.CommunityLeaderboardBloc(gh<_i343.CommunityRepository>()));
    gh.factory<_i278.TokenRepository>(
        () => _i179.TokenRepositoryImpl(gh<_i494.TokenRemoteDataSource>()));
    gh.factory<_i263.LoginBloc>(
        () => _i263.LoginBloc(gh<_i268.LoginRepository>()));
    gh.factory<_i358.ChatBloc>(() => _i358.ChatBloc(gh<_i63.ChatRepository>()));
    gh.factory<_i468.SignupRepository>(
        () => _i145.SignupRepositoryImpl(gh<_i88.SignupRemoteDataSource>()));
    gh.factory<_i118.SignupBloc>(
        () => _i118.SignupBloc(gh<_i468.SignupRepository>()));
    gh.factory<_i265.TokenManager>(() => _i265.TokenManager(
          gh<_i283.SettingsManager>(),
          gh<_i278.TokenRepository>(),
          gh<_i234.AppLog>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i825.NetworkModule {}
