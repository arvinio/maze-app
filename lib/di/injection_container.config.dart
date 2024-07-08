// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i9;
import 'package:maze_app/core/config/assets/assets.dart' as _i4;
import 'package:maze_app/core/config/strings.dart' as _i5;
import 'package:maze_app/core/local/setting_manager.dart' as _i14;
import 'package:maze_app/core/local/user/user_manager.dart' as _i17;
import 'package:maze_app/core/network/dio_caller.dart' as _i18;
import 'package:maze_app/core/network/util/expire_token_interceptor.dart'
    as _i11;
import 'package:maze_app/core/presentation/route/app_router.dart' as _i6;
import 'package:maze_app/core/style/app_color.dart' as _i7;
import 'package:maze_app/core/style/app_theme.dart' as _i16;
import 'package:maze_app/core/util/app_log.dart' as _i12;
import 'package:maze_app/core/util/crypto/encrypt_helper.dart' as _i8;
import 'package:maze_app/core/util/shared_preferences_helper.dart' as _i13;
import 'package:maze_app/data_provider/refresh_token/data/data_source/token_remote_data_source.dart'
    as _i42;
import 'package:maze_app/data_provider/refresh_token/data/repository/token_repository_impl.dart'
    as _i62;
import 'package:maze_app/data_provider/refresh_token/domain/token_repository.dart'
    as _i61;
import 'package:maze_app/data_provider/refresh_token/token_manager.dart'
    as _i73;
import 'package:maze_app/di/injection_container.dart' as _i74;
import 'package:maze_app/feature/account_info/data/data_source/account_info_remote_data_source.dart'
    as _i38;
import 'package:maze_app/feature/account_info/data/data_source/account_info_remote_data_source_impl.dart'
    as _i39;
import 'package:maze_app/feature/account_info/data/repository/account_info_repository_impl.dart'
    as _i47;
import 'package:maze_app/feature/account_info/domain/entity/user_info.dart'
    as _i10;
import 'package:maze_app/feature/account_info/domain/repository/account_info_repository.dart'
    as _i46;
import 'package:maze_app/feature/account_info/presentation/bloc/account_info_bloc.dart'
    as _i63;
import 'package:maze_app/feature/auth/create_password/data/data_source/create_password_remote_data_source.dart'
    as _i30;
import 'package:maze_app/feature/auth/create_password/data/data_source/create_password_remote_data_source_impl.dart'
    as _i31;
import 'package:maze_app/feature/auth/create_password/data/repository/create_password_repository_impl.dart'
    as _i66;
import 'package:maze_app/feature/auth/create_password/domain/repository/create_password_repository.dart'
    as _i65;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/data_source/forgot_pass_remote_data_source.dart'
    as _i21;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/data_source/forgot_pass_remote_data_source_impl.dart'
    as _i22;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/repository/forgot_pass_repository_impl.dart'
    as _i27;
import 'package:maze_app/feature/auth/create_password/forgot_password/domain/repository/forgot_pass_repository.dart'
    as _i26;
import 'package:maze_app/feature/auth/create_password/forgot_password/presentation/bloc/forgot_pass_bloc.dart'
    as _i35;
import 'package:maze_app/feature/auth/create_password/presentation/bloc/create_pass_bloc.dart'
    as _i68;
import 'package:maze_app/feature/auth/login/data/data_source/login_remote_data_source.dart'
    as _i19;
import 'package:maze_app/feature/auth/login/data/data_source/login_remote_data_source_impl.dart'
    as _i20;
import 'package:maze_app/feature/auth/login/data/repository/login_repository_impl.dart'
    as _i37;
import 'package:maze_app/feature/auth/login/domain/repository/login_repository.dart'
    as _i36;
import 'package:maze_app/feature/auth/login/presentation/bloc/login_bloc.dart'
    as _i67;
import 'package:maze_app/feature/auth/signing_up/data/data_source/verify_remote_data_source.dart'
    as _i23;
import 'package:maze_app/feature/auth/signing_up/data/data_source/verify_remote_data_source_impl.dart'
    as _i24;
import 'package:maze_app/feature/auth/signing_up/data/repository/verify_repository_impl.dart'
    as _i41;
import 'package:maze_app/feature/auth/signing_up/domain/repository/verify_repository.dart'
    as _i40;
import 'package:maze_app/feature/auth/signing_up/presentation/bloc/verify_bloc.dart'
    as _i43;
import 'package:maze_app/feature/auth/signup/data/data_source/signup_remote_data_source.dart'
    as _i58;
import 'package:maze_app/feature/auth/signup/data/data_source/signup_remote_data_source_impl.dart'
    as _i59;
import 'package:maze_app/feature/auth/signup/data/repository/signup_repository_impl.dart'
    as _i71;
import 'package:maze_app/feature/auth/signup/domain/repository/signup_repository.dart'
    as _i70;
import 'package:maze_app/feature/auth/signup/presentation/bloc/signup_bloc.dart'
    as _i72;
import 'package:maze_app/feature/intro/data/datasource/intro_local_datasource.dart'
    as _i25;
import 'package:maze_app/feature/intro/data/repo/intro_repo_impl.dart' as _i29;
import 'package:maze_app/feature/intro/domain/repo/intro_repo.dart' as _i28;
import 'package:maze_app/feature/intro/domain/usecase/get_is_first_run.dart'
    as _i44;
import 'package:maze_app/feature/intro/domain/usecase/set_is_first_run.dart'
    as _i45;
import 'package:maze_app/feature/intro/presentation/cubit/intro_cubit.dart'
    as _i69;
import 'package:maze_app/feature/knowledge/data/datasource/knowledge_remote_datasource.dart'
    as _i32;
import 'package:maze_app/feature/knowledge/data/repo/knowledge_repo_impl.dart'
    as _i34;
import 'package:maze_app/feature/knowledge/domain/repo/knowledge_repo.dart'
    as _i33;
import 'package:maze_app/feature/knowledge/domain/usecase/create_article.dart'
    as _i48;
import 'package:maze_app/feature/knowledge/domain/usecase/delete_article.dart'
    as _i49;
import 'package:maze_app/feature/knowledge/domain/usecase/edit_article.dart'
    as _i50;
import 'package:maze_app/feature/knowledge/domain/usecase/get_article.dart'
    as _i51;
import 'package:maze_app/feature/knowledge/domain/usecase/get_articles.dart'
    as _i52;
import 'package:maze_app/feature/knowledge/domain/usecase/get_bookmarks.dart'
    as _i53;
import 'package:maze_app/feature/knowledge/domain/usecase/get_categories.dart'
    as _i54;
import 'package:maze_app/feature/knowledge/domain/usecase/remove_bookmark.dart'
    as _i55;
import 'package:maze_app/feature/knowledge/domain/usecase/search_articles.dart'
    as _i56;
import 'package:maze_app/feature/knowledge/domain/usecase/set_bookmark.dart'
    as _i57;
import 'package:maze_app/feature/knowledge/presentation/bookmarks/cubit/bookmarks_cubit.dart'
    as _i64;
import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart'
    as _i60;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i3.PrettyDioLogger>(() => networkModule.prettyDioLogger);
    gh.lazySingleton<_i4.AssetsBase>(() => _i4.AssetsBase());
    gh.lazySingleton<_i5.StringsBase>(() => _i5.StringsBase());
    gh.lazySingleton<_i6.AppRouter>(() => _i6.AppRouter());
    gh.lazySingleton<_i7.AppColorsBase>(() => _i7.AppColorsBase());
    gh.lazySingleton<_i8.EncryptHelper>(() => _i8.EncryptHelper());
    gh.lazySingleton<_i9.Logger>(() => networkModule.logger);
    gh.lazySingleton<_i10.UserInfo>(() => _i10.UserInfo());
    gh.lazySingleton<_i11.ExpireTokenInterceptor>(
        () => _i11.ExpireTokenInterceptor(gh<_i8.EncryptHelper>()));
    gh.lazySingleton<_i12.AppLog>(() => _i12.AppLog(gh<_i9.Logger>()));
    gh.factory<_i13.SharedPreferencesHelper>(() =>
        _i13.SharedPreferencesHelper(encryptHelper: gh<_i8.EncryptHelper>()));
    gh.factory<_i14.SettingsManager>(
        () => _i14.SettingsManager(gh<_i13.SharedPreferencesHelper>()));
    gh.lazySingleton<_i15.Dio>(
      () => networkModule.provideBaseDio(gh<_i3.PrettyDioLogger>()),
      instanceName: 'maze',
    );
    gh.lazySingleton<_i15.Dio>(
      () => networkModule.provideMazeDio(gh<_i3.PrettyDioLogger>()),
      instanceName: 'versioning0',
    );
    gh.factory<_i16.AppTheme>(
        () => _i16.AppTheme(appColors: gh<_i7.AppColorsBase>()));
    gh.lazySingleton<_i15.Dio>(
      () => networkModule.provideTokenDio(gh<_i3.PrettyDioLogger>()),
      instanceName: 'token',
    );
    gh.lazySingleton<_i17.UserManager>(
        () => _i17.UserManager(gh<_i14.SettingsManager>()));
    gh.lazySingleton<_i18.DioCaller>(
      () => networkModule
          .provideBaseDioCaller(gh<_i15.Dio>(instanceName: 'maze')),
      instanceName: 'maze',
    );
    gh.factory<_i19.LoginRemoteDataSource>(() => _i20.LoginRemoteDataSourceImpl(
        dioCaller: gh<_i18.DioCaller>(instanceName: 'maze')));
    gh.factory<_i21.ForgotPassRemoteDataSource>(() =>
        _i22.ForgotPassRemoteDataSourceImpl(
            dioCaller: gh<_i18.DioCaller>(instanceName: 'maze')));
    gh.factory<_i23.VerifyRemoteDataSource>(() =>
        _i24.VerifyRemoteDataSourceImpl(
            dioCaller: gh<_i18.DioCaller>(instanceName: 'maze')));
    gh.factory<_i25.IntroLocalDatasource>(() => _i25.IntroLocalDatasourceImpl(
        helper: gh<_i13.SharedPreferencesHelper>()));
    gh.lazySingleton<_i18.DioCaller>(
      () => networkModule
          .provideTokenDioCaller(gh<_i15.Dio>(instanceName: 'token')),
      instanceName: 'token',
    );
    gh.factory<_i26.ForgotPassRepository>(() =>
        _i27.ForgotPassRepositoryImpl(gh<_i21.ForgotPassRemoteDataSource>()));
    gh.lazySingleton<_i18.DioCaller>(
      () => networkModule
          .provideMazeDioCaller(gh<_i15.Dio>(instanceName: 'versioning0')),
      instanceName: 'versioning0',
    );
    gh.factory<_i28.IntroRepo>(
        () => _i29.IntroRepoImpl(datasource: gh<_i25.IntroLocalDatasource>()));
    gh.factory<_i30.CreatePasswordRemoteDataSource>(() =>
        _i31.CreatePasswordRemoteDataSourceImpl(
            dioCaller: gh<_i18.DioCaller>(instanceName: 'token')));
    gh.factory<_i32.KnowledgeRemoteDatasource>(() =>
        _i32.KnowledgeRemoteDataSourceImpl(
            dioCaller: gh<_i18.DioCaller>(instanceName: 'token')));
    gh.factory<_i33.KnowledgeRepo>(() => _i34.KnowledgeRepoImpl(
        remoteDatasource: gh<_i32.KnowledgeRemoteDatasource>()));
    gh.factory<_i35.ForgotPassBloc>(
        () => _i35.ForgotPassBloc(gh<_i26.ForgotPassRepository>()));
    gh.factory<_i36.LoginRepository>(
        () => _i37.LoginRepositoryImpl(gh<_i19.LoginRemoteDataSource>()));
    gh.factory<_i38.AccountInfoRemoteRemoteDataSource>(() =>
        _i39.AccountInfoRemoteRemoteDataSourceImpl(
            dioCaller: gh<_i18.DioCaller>(instanceName: 'token')));
    gh.factory<_i40.VerifyRepository>(
        () => _i41.VerifyRepositoryImpl(gh<_i23.VerifyRemoteDataSource>()));
    gh.factory<_i42.TokenRemoteDataSource>(() => _i42.TokenRemoteDataSourceImpl(
        gh<_i18.DioCaller>(instanceName: 'maze')));
    gh.factory<_i43.VerifyBloc>(
        () => _i43.VerifyBloc(gh<_i40.VerifyRepository>()));
    gh.factory<_i44.GetIsFirstRun>(
        () => _i44.GetIsFirstRun(repo: gh<_i28.IntroRepo>()));
    gh.factory<_i45.SetIsFirstRun>(
        () => _i45.SetIsFirstRun(repo: gh<_i28.IntroRepo>()));
    gh.factory<_i46.AccountInfoRepository>(() => _i47.AccountInfoRepositoryImpl(
        gh<_i38.AccountInfoRemoteRemoteDataSource>()));
    gh.factory<_i48.CreateArticle>(
        () => _i48.CreateArticle(repo: gh<_i33.KnowledgeRepo>()));
    gh.factory<_i49.DeleteArticle>(
        () => _i49.DeleteArticle(repo: gh<_i33.KnowledgeRepo>()));
    gh.factory<_i50.EditArticle>(
        () => _i50.EditArticle(repo: gh<_i33.KnowledgeRepo>()));
    gh.factory<_i51.GetArticle>(
        () => _i51.GetArticle(repo: gh<_i33.KnowledgeRepo>()));
    gh.factory<_i52.GetArticles>(
        () => _i52.GetArticles(repo: gh<_i33.KnowledgeRepo>()));
    gh.factory<_i53.GetBookmarks>(
        () => _i53.GetBookmarks(repo: gh<_i33.KnowledgeRepo>()));
    gh.factory<_i54.GetCategories>(
        () => _i54.GetCategories(repo: gh<_i33.KnowledgeRepo>()));
    gh.factory<_i55.RemoveBookmark>(
        () => _i55.RemoveBookmark(repo: gh<_i33.KnowledgeRepo>()));
    gh.factory<_i56.SearchArticles>(
        () => _i56.SearchArticles(repo: gh<_i33.KnowledgeRepo>()));
    gh.factory<_i57.SetBookmark>(
        () => _i57.SetBookmark(repo: gh<_i33.KnowledgeRepo>()));
    gh.factory<_i58.SignupRemoteDataSource>(() =>
        _i59.SignupRemoteDataSourceImpl(
            dioCaller: gh<_i18.DioCaller>(instanceName: 'maze')));
    gh.factory<_i60.KnowledgeCubit>(() => _i60.KnowledgeCubit(
          getArticles: gh<_i52.GetArticles>(),
          router: gh<_i6.AppRouter>(),
          searchArticles: gh<_i56.SearchArticles>(),
          getCategories: gh<_i54.GetCategories>(),
        ));
    gh.factory<_i61.TokenRepository>(
        () => _i62.TokenRepositoryImpl(gh<_i42.TokenRemoteDataSource>()));
    gh.factory<_i63.AccountInfoBloc>(
        () => _i63.AccountInfoBloc(gh<_i46.AccountInfoRepository>()));
    gh.factory<_i64.BookmarksCubit>(() => _i64.BookmarksCubit(
          getBookmarks: gh<_i53.GetBookmarks>(),
          router: gh<_i6.AppRouter>(),
          removeBookmark: gh<_i55.RemoveBookmark>(),
          setBookmark: gh<_i57.SetBookmark>(),
        ));
    gh.factory<_i65.CreatePasswordRepository>(() =>
        _i66.CreatePasswordRepositoryImpl(
            gh<_i30.CreatePasswordRemoteDataSource>()));
    gh.factory<_i67.LoginBloc>(
        () => _i67.LoginBloc(gh<_i36.LoginRepository>()));
    gh.factory<_i68.CreatePassBloc>(
        () => _i68.CreatePassBloc(gh<_i65.CreatePasswordRepository>()));
    gh.factory<_i69.IntroCubit>(() => _i69.IntroCubit(
          getIsFirstRun: gh<_i44.GetIsFirstRun>(),
          setIsFirstRun: gh<_i45.SetIsFirstRun>(),
          router: gh<_i6.AppRouter>(),
        ));
    gh.factory<_i70.SignupRepository>(
        () => _i71.SignupRepositoryImpl(gh<_i58.SignupRemoteDataSource>()));
    gh.factory<_i72.SignupBloc>(
        () => _i72.SignupBloc(gh<_i70.SignupRepository>()));
    gh.factory<_i73.TokenManager>(() => _i73.TokenManager(
          gh<_i14.SettingsManager>(),
          gh<_i61.TokenRepository>(),
          gh<_i12.AppLog>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i74.NetworkModule {}
