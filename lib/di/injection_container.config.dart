// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i9;
import 'package:maze_app/core/config/assets/assets.dart' as _i4;
import 'package:maze_app/core/config/strings.dart' as _i5;
import 'package:maze_app/core/local/setting_manager.dart' as _i13;
import 'package:maze_app/core/local/user/user_manager.dart' as _i16;
import 'package:maze_app/core/network/dio_caller.dart' as _i17;
import 'package:maze_app/core/network/util/expire_token_interceptor.dart'
    as _i10;
import 'package:maze_app/core/presentation/route/app_router.dart' as _i6;
import 'package:maze_app/core/style/app_color.dart' as _i7;
import 'package:maze_app/core/style/app_theme.dart' as _i15;
import 'package:maze_app/core/util/app_log.dart' as _i11;
import 'package:maze_app/core/util/crypto/encrypt_helper.dart' as _i8;
import 'package:maze_app/core/util/shared_preferences_helper.dart' as _i12;
import 'package:maze_app/data_provider/refresh_token/data/data_source/token_remote_data_source.dart'
    as _i39;
import 'package:maze_app/data_provider/refresh_token/data/repository/token_repository_impl.dart'
    as _i47;
import 'package:maze_app/data_provider/refresh_token/domain/token_repository.dart'
    as _i46;
import 'package:maze_app/data_provider/refresh_token/token_manager.dart'
    as _i57;
import 'package:maze_app/di/injection_container.dart' as _i58;
import 'package:maze_app/feature/auth/create_password/data/data_source/create_password_remote_data_source.dart'
    as _i29;
import 'package:maze_app/feature/auth/create_password/data/data_source/create_password_remote_data_source_impl.dart'
    as _i30;
import 'package:maze_app/feature/auth/create_password/data/repository/create_password_repository_impl.dart'
    as _i49;
import 'package:maze_app/feature/auth/create_password/domain/repository/create_password_repository.dart'
    as _i48;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/data_source/forgot_pass_remote_data_source.dart'
    as _i20;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/data_source/forgot_pass_remote_data_source_impl.dart'
    as _i21;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/repository/forgot_pass_repository_impl.dart'
    as _i26;
import 'package:maze_app/feature/auth/create_password/forgot_password/domain/repository/forgot_pass_repository.dart'
    as _i25;
import 'package:maze_app/feature/auth/create_password/forgot_password/presentation/bloc/forgot_pass_bloc.dart'
    as _i34;
import 'package:maze_app/feature/auth/create_password/presentation/bloc/create_pass_bloc.dart'
    as _i51;
import 'package:maze_app/feature/auth/login/data/data_source/login_remote_data_source.dart'
    as _i18;
import 'package:maze_app/feature/auth/login/data/data_source/login_remote_data_source_impl.dart'
    as _i19;
import 'package:maze_app/feature/auth/login/data/repository/login_repository_impl.dart'
    as _i36;
import 'package:maze_app/feature/auth/login/domain/repository/login_repository.dart'
    as _i35;
import 'package:maze_app/feature/auth/login/presentation/bloc/login_bloc.dart'
    as _i50;
import 'package:maze_app/feature/auth/signing_up/data/data_source/verify_remote_data_source.dart'
    as _i22;
import 'package:maze_app/feature/auth/signing_up/data/data_source/verify_remote_data_source_impl.dart'
    as _i23;
import 'package:maze_app/feature/auth/signing_up/data/repository/verify_repository_impl.dart'
    as _i38;
import 'package:maze_app/feature/auth/signing_up/domain/repository/verify_repository.dart'
    as _i37;
import 'package:maze_app/feature/auth/signing_up/presentation/bloc/verify_bloc.dart'
    as _i40;
import 'package:maze_app/feature/auth/signup/data/data_source/signup_remote_data_source.dart'
    as _i44;
import 'package:maze_app/feature/auth/signup/data/data_source/signup_remote_data_source_impl.dart'
    as _i45;
import 'package:maze_app/feature/auth/signup/data/repository/signup_repository_impl.dart'
    as _i55;
import 'package:maze_app/feature/auth/signup/domain/repository/signup_repository.dart'
    as _i54;
import 'package:maze_app/feature/auth/signup/presentation/bloc/signup_bloc.dart'
    as _i56;
import 'package:maze_app/feature/intro/data/datasource/intro_local_datasource.dart'
    as _i24;
import 'package:maze_app/feature/intro/data/repo/intro_repo_impl.dart' as _i28;
import 'package:maze_app/feature/intro/domain/repo/intro_repo.dart' as _i27;
import 'package:maze_app/feature/intro/domain/usecase/get_is_first_run.dart'
    as _i41;
import 'package:maze_app/feature/intro/domain/usecase/set_is_first_run.dart'
    as _i42;
import 'package:maze_app/feature/intro/presentation/cubit/intro_cubit.dart'
    as _i53;
import 'package:maze_app/feature/knowledge/data/datasource/knowledge_remote_datasource.dart'
    as _i31;
import 'package:maze_app/feature/knowledge/data/repo/knowledge_repo_impl.dart'
    as _i33;
import 'package:maze_app/feature/knowledge/domain/repo/knowledge_repo.dart'
    as _i32;
import 'package:maze_app/feature/knowledge/domain/usecase/get_articles.dart'
    as _i43;
import 'package:maze_app/feature/knowledge/presentation/cubit/knowledge_cubit.dart'
    as _i52;
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
    gh.lazySingleton<_i10.ExpireTokenInterceptor>(
        () => _i10.ExpireTokenInterceptor(gh<_i8.EncryptHelper>()));
    gh.lazySingleton<_i11.AppLog>(() => _i11.AppLog(gh<_i9.Logger>()));
    gh.factory<_i12.SharedPreferencesHelper>(() =>
        _i12.SharedPreferencesHelper(encryptHelper: gh<_i8.EncryptHelper>()));
    gh.factory<_i13.SettingsManager>(
        () => _i13.SettingsManager(gh<_i12.SharedPreferencesHelper>()));
    gh.lazySingleton<_i14.Dio>(
      () => networkModule.provideBaseDio(gh<_i3.PrettyDioLogger>()),
      instanceName: 'maze',
    );
    gh.lazySingleton<_i14.Dio>(
      () => networkModule.provideMazeDio(gh<_i3.PrettyDioLogger>()),
      instanceName: 'versioning0',
    );
    gh.factory<_i15.AppTheme>(
        () => _i15.AppTheme(appColors: gh<_i7.AppColorsBase>()));
    gh.lazySingleton<_i14.Dio>(
      () => networkModule.provideTokenDio(gh<_i3.PrettyDioLogger>()),
      instanceName: 'token',
    );
    gh.lazySingleton<_i16.UserManager>(
        () => _i16.UserManager(gh<_i13.SettingsManager>()));
    gh.lazySingleton<_i17.DioCaller>(
      () => networkModule
          .provideBaseDioCaller(gh<_i14.Dio>(instanceName: 'maze')),
      instanceName: 'maze',
    );
    gh.factory<_i18.LoginRemoteDataSource>(() => _i19.LoginRemoteDataSourceImpl(
        dioCaller: gh<_i17.DioCaller>(instanceName: 'maze')));
    gh.factory<_i20.ForgotPassRemoteDataSource>(() =>
        _i21.ForgotPassRemoteDataSourceImpl(
            dioCaller: gh<_i17.DioCaller>(instanceName: 'maze')));
    gh.factory<_i22.VerifyRemoteDataSource>(() =>
        _i23.VerifyRemoteDataSourceImpl(
            dioCaller: gh<_i17.DioCaller>(instanceName: 'maze')));
    gh.factory<_i24.IntroLocalDatasource>(() => _i24.IntroLocalDatasourceImpl(
        helper: gh<_i12.SharedPreferencesHelper>()));
    gh.lazySingleton<_i17.DioCaller>(
      () => networkModule
          .provideTokenDioCaller(gh<_i14.Dio>(instanceName: 'token')),
      instanceName: 'token',
    );
    gh.factory<_i25.ForgotPassRepository>(() =>
        _i26.ForgotPassRepositoryImpl(gh<_i20.ForgotPassRemoteDataSource>()));
    gh.lazySingleton<_i17.DioCaller>(
      () => networkModule
          .provideMazeDioCaller(gh<_i14.Dio>(instanceName: 'versioning0')),
      instanceName: 'versioning0',
    );
    gh.factory<_i27.IntroRepo>(
        () => _i28.IntroRepoImpl(datasource: gh<_i24.IntroLocalDatasource>()));
    gh.factory<_i29.CreatePasswordRemoteDataSource>(() =>
        _i30.CreatePasswordRemoteDataSourceImpl(
            dioCaller: gh<_i17.DioCaller>(instanceName: 'token')));
    gh.factory<_i31.KnowledgeRemoteDatasource>(() =>
        _i31.KnowledgeRemoteDataSourceImpl(
            dioCaller: gh<_i17.DioCaller>(instanceName: 'token')));
    gh.factory<_i32.KnowledgeRepo>(() => _i33.KnowledgeRepoImpl(
        remoteDatasource: gh<_i31.KnowledgeRemoteDatasource>()));
    gh.factory<_i34.ForgotPassBloc>(
        () => _i34.ForgotPassBloc(gh<_i25.ForgotPassRepository>()));
    gh.factory<_i35.LoginRepository>(
        () => _i36.LoginRepositoryImpl(gh<_i18.LoginRemoteDataSource>()));
    gh.factory<_i37.VerifyRepository>(
        () => _i38.VerifyRepositoryImpl(gh<_i22.VerifyRemoteDataSource>()));
    gh.factory<_i39.TokenRemoteDataSource>(() => _i39.TokenRemoteDataSourceImpl(
        gh<_i17.DioCaller>(instanceName: 'maze')));
    gh.factory<_i40.VerifyBloc>(
        () => _i40.VerifyBloc(gh<_i37.VerifyRepository>()));
    gh.factory<_i41.GetIsFirstRun>(
        () => _i41.GetIsFirstRun(repo: gh<_i27.IntroRepo>()));
    gh.factory<_i42.SetIsFirstRun>(
        () => _i42.SetIsFirstRun(repo: gh<_i27.IntroRepo>()));
    gh.factory<_i43.GetArticles>(
        () => _i43.GetArticles(repo: gh<_i32.KnowledgeRepo>()));
    gh.factory<_i44.SignupRemoteDataSource>(() =>
        _i45.SignupRemoteDataSourceImpl(
            dioCaller: gh<_i17.DioCaller>(instanceName: 'maze')));
    gh.factory<_i46.TokenRepository>(
        () => _i47.TokenRepositoryImpl(gh<_i39.TokenRemoteDataSource>()));
    gh.factory<_i48.CreatePasswordRepository>(() =>
        _i49.CreatePasswordRepositoryImpl(
            gh<_i29.CreatePasswordRemoteDataSource>()));
    gh.factory<_i50.LoginBloc>(
        () => _i50.LoginBloc(gh<_i35.LoginRepository>()));
    gh.factory<_i51.CreatePassBloc>(
        () => _i51.CreatePassBloc(gh<_i48.CreatePasswordRepository>()));
    gh.factory<_i52.KnowledgeCubit>(() => _i52.KnowledgeCubit(
          getArticles: gh<_i43.GetArticles>(),
          router: gh<_i6.AppRouter>(),
        ));
    gh.factory<_i53.IntroCubit>(() => _i53.IntroCubit(
          getIsFirstRun: gh<_i41.GetIsFirstRun>(),
          setIsFirstRun: gh<_i42.SetIsFirstRun>(),
          router: gh<_i6.AppRouter>(),
        ));
    gh.factory<_i54.SignupRepository>(
        () => _i55.SignupRepositoryImpl(gh<_i44.SignupRemoteDataSource>()));
    gh.factory<_i56.SignupBloc>(
        () => _i56.SignupBloc(gh<_i54.SignupRepository>()));
    gh.factory<_i57.TokenManager>(() => _i57.TokenManager(
          gh<_i13.SettingsManager>(),
          gh<_i46.TokenRepository>(),
          gh<_i11.AppLog>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i58.NetworkModule {}
