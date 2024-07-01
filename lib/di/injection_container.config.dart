// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:maze_app/core/config/assets/assets.dart' as _i7;
import 'package:maze_app/core/config/strings.dart' as _i6;
import 'package:maze_app/core/local/setting_manager.dart' as _i15;
import 'package:maze_app/core/local/user/user_manager.dart' as _i18;
import 'package:maze_app/core/network/dio_caller.dart' as _i19;
import 'package:maze_app/core/network/util/expire_token_interceptor.dart'
    as _i12;
import 'package:maze_app/core/presentation/route/app_router.dart' as _i9;
import 'package:maze_app/core/style/app_color.dart' as _i8;
import 'package:maze_app/core/style/app_theme.dart' as _i17;
import 'package:maze_app/core/util/app_log.dart' as _i13;
import 'package:maze_app/core/util/crypto/encrypt_helper.dart' as _i5;
import 'package:maze_app/core/util/shared_preferences_helper.dart' as _i14;
import 'package:maze_app/data_provider/refresh_token/data/data_source/token_remote_data_source.dart'
    as _i38;
import 'package:maze_app/data_provider/refresh_token/data/repository/token_repository_impl.dart'
    as _i45;
import 'package:maze_app/data_provider/refresh_token/domain/token_repository.dart'
    as _i44;
import 'package:maze_app/data_provider/refresh_token/token_manager.dart'
    as _i54;
import 'package:maze_app/di/injection_container.dart' as _i55;
import 'package:maze_app/feature/auth/create_password/data/data_source/create_password_remote_data_source.dart'
    as _i31;
import 'package:maze_app/feature/auth/create_password/data/data_source/create_password_remote_data_source_impl.dart'
    as _i32;
import 'package:maze_app/feature/auth/create_password/data/repository/create_password_repository_impl.dart'
    as _i47;
import 'package:maze_app/feature/auth/create_password/domain/repository/create_password_repository.dart'
    as _i46;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/data_source/forgot_pass_remote_data_source.dart'
    as _i22;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/data_source/forgot_pass_remote_data_source_impl.dart'
    as _i23;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/repository/forgot_pass_repository_impl.dart'
    as _i28;
import 'package:maze_app/feature/auth/create_password/forgot_password/domain/repository/forgot_pass_repository.dart'
    as _i27;
import 'package:maze_app/feature/auth/create_password/forgot_password/presentation/bloc/forgot_pass_bloc.dart'
    as _i33;
import 'package:maze_app/feature/auth/create_password/presentation/bloc/create_pass_bloc.dart'
    as _i49;
import 'package:maze_app/feature/auth/login/data/data_source/login_remote_data_source.dart'
    as _i20;
import 'package:maze_app/feature/auth/login/data/data_source/login_remote_data_source_impl.dart'
    as _i21;
import 'package:maze_app/feature/auth/login/data/repository/login_repository_impl.dart'
    as _i35;
import 'package:maze_app/feature/auth/login/domain/repository/login_repository.dart'
    as _i34;
import 'package:maze_app/feature/auth/login/presentation/bloc/login_bloc.dart'
    as _i48;
import 'package:maze_app/feature/auth/signing_up/data/data_source/verify_remote_data_source.dart'
    as _i24;
import 'package:maze_app/feature/auth/signing_up/data/data_source/verify_remote_data_source_impl.dart'
    as _i25;
import 'package:maze_app/feature/auth/signing_up/data/repository/verify_repository_impl.dart'
    as _i37;
import 'package:maze_app/feature/auth/signing_up/domain/repository/verify_repository.dart'
    as _i36;
import 'package:maze_app/feature/auth/signing_up/presentation/bloc/verify_bloc.dart'
    as _i39;
import 'package:maze_app/feature/auth/signup/data/data_source/signup_remote_data_source.dart'
    as _i42;
import 'package:maze_app/feature/auth/signup/data/data_source/signup_remote_data_source_impl.dart'
    as _i43;
import 'package:maze_app/feature/auth/signup/data/repository/signup_repository_impl.dart'
    as _i52;
import 'package:maze_app/feature/auth/signup/domain/repository/signup_repository.dart'
    as _i51;
import 'package:maze_app/feature/auth/signup/presentation/bloc/signup_bloc.dart'
    as _i53;
import 'package:maze_app/feature/intro/data/datasource/intro_local_datasource.dart'
    as _i26;
import 'package:maze_app/feature/intro/data/repo/intro_repo_impl.dart' as _i30;
import 'package:maze_app/feature/intro/domain/repo/intro_repo.dart' as _i29;
import 'package:maze_app/feature/intro/domain/usecase/get_is_first_run.dart'
    as _i41;
import 'package:maze_app/feature/intro/domain/usecase/set_is_first_run.dart'
    as _i40;
import 'package:maze_app/feature/intro/presentation/cubit/intro_cubit.dart'
    as _i50;
import 'package:maze_app/feature/knowledge/domain/repo/knowledge_repo.dart'
    as _i11;
import 'package:maze_app/feature/knowledge/domain/usecase/get_articles.dart'
    as _i10;
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
    gh.lazySingleton<_i4.Logger>(() => networkModule.logger);
    gh.lazySingleton<_i5.EncryptHelper>(() => _i5.EncryptHelper());
    gh.lazySingleton<_i6.StringsBase>(() => _i6.StringsBase());
    gh.lazySingleton<_i7.AssetsBase>(() => _i7.AssetsBase());
    gh.lazySingleton<_i8.AppColorsBase>(() => _i8.AppColorsBase());
    gh.lazySingleton<_i9.AppRouter>(() => _i9.AppRouter());
    gh.factory<_i10.GetArticles>(
        () => _i10.GetArticles(repo: gh<_i11.KnowledgeRepo>()));
    gh.lazySingleton<_i12.ExpireTokenInterceptor>(
        () => _i12.ExpireTokenInterceptor(gh<_i5.EncryptHelper>()));
    gh.lazySingleton<_i13.AppLog>(() => _i13.AppLog(gh<_i4.Logger>()));
    gh.factory<_i14.SharedPreferencesHelper>(() =>
        _i14.SharedPreferencesHelper(encryptHelper: gh<_i5.EncryptHelper>()));
    gh.factory<_i15.SettingsManager>(
        () => _i15.SettingsManager(gh<_i14.SharedPreferencesHelper>()));
    gh.lazySingleton<_i16.Dio>(
      () => networkModule.provideBaseDio(gh<_i3.PrettyDioLogger>()),
      instanceName: 'maze',
    );
    gh.lazySingleton<_i16.Dio>(
      () => networkModule.provideMazeDio(gh<_i3.PrettyDioLogger>()),
      instanceName: 'versioning0',
    );
    gh.factory<_i17.AppTheme>(
        () => _i17.AppTheme(appColors: gh<_i8.AppColorsBase>()));
    gh.lazySingleton<_i16.Dio>(
      () => networkModule.provideTokenDio(gh<_i3.PrettyDioLogger>()),
      instanceName: 'token',
    );
    gh.lazySingleton<_i18.UserManager>(
        () => _i18.UserManager(gh<_i15.SettingsManager>()));
    gh.lazySingleton<_i19.DioCaller>(
      () => networkModule
          .provideBaseDioCaller(gh<_i16.Dio>(instanceName: 'maze')),
      instanceName: 'maze',
    );
    gh.factory<_i20.LoginRemoteDataSource>(() => _i21.LoginRemoteDataSourceImpl(
        dioCaller: gh<_i19.DioCaller>(instanceName: 'maze')));
    gh.factory<_i22.ForgotPassRemoteDataSource>(() =>
        _i23.ForgotPassRemoteDataSourceImpl(
            dioCaller: gh<_i19.DioCaller>(instanceName: 'maze')));
    gh.factory<_i24.VerifyRemoteDataSource>(() =>
        _i25.VerifyRemoteDataSourceImpl(
            dioCaller: gh<_i19.DioCaller>(instanceName: 'maze')));
    gh.factory<_i26.IntroLocalDatasource>(() => _i26.IntroLocalDatasourceImpl(
        helper: gh<_i14.SharedPreferencesHelper>()));
    gh.lazySingleton<_i19.DioCaller>(
      () => networkModule
          .provideTokenDioCaller(gh<_i16.Dio>(instanceName: 'token')),
      instanceName: 'token',
    );
    gh.factory<_i27.ForgotPassRepository>(() =>
        _i28.ForgotPassRepositoryImpl(gh<_i22.ForgotPassRemoteDataSource>()));
    gh.lazySingleton<_i19.DioCaller>(
      () => networkModule
          .provideMazeDioCaller(gh<_i16.Dio>(instanceName: 'versioning0')),
      instanceName: 'versioning0',
    );
    gh.factory<_i29.IntroRepo>(
        () => _i30.IntroRepoImpl(datasource: gh<_i26.IntroLocalDatasource>()));
    gh.factory<_i31.CreatePasswordRemoteDataSource>(() =>
        _i32.CreatePasswordRemoteDataSourceImpl(
            dioCaller: gh<_i19.DioCaller>(instanceName: 'token')));
    gh.factory<_i33.ForgotPassBloc>(
        () => _i33.ForgotPassBloc(gh<_i27.ForgotPassRepository>()));
    gh.factory<_i34.LoginRepository>(
        () => _i35.LoginRepositoryImpl(gh<_i20.LoginRemoteDataSource>()));
    gh.factory<_i36.VerifyRepository>(
        () => _i37.VerifyRepositoryImpl(gh<_i24.VerifyRemoteDataSource>()));
    gh.factory<_i38.TokenRemoteDataSource>(() => _i38.TokenRemoteDataSourceImpl(
        gh<_i19.DioCaller>(instanceName: 'maze')));
    gh.factory<_i39.VerifyBloc>(
        () => _i39.VerifyBloc(gh<_i36.VerifyRepository>()));
    gh.factory<_i40.SetIsFirstRun>(
        () => _i40.SetIsFirstRun(repo: gh<_i29.IntroRepo>()));
    gh.factory<_i41.GetIsFirstRun>(
        () => _i41.GetIsFirstRun(repo: gh<_i29.IntroRepo>()));
    gh.factory<_i42.SignupRemoteDataSource>(() =>
        _i43.SignupRemoteDataSourceImpl(
            dioCaller: gh<_i19.DioCaller>(instanceName: 'maze')));
    gh.factory<_i44.TokenRepository>(
        () => _i45.TokenRepositoryImpl(gh<_i38.TokenRemoteDataSource>()));
    gh.factory<_i46.CreatePasswordRepository>(() =>
        _i47.CreatePasswordRepositoryImpl(
            gh<_i31.CreatePasswordRemoteDataSource>()));
    gh.factory<_i48.LoginBloc>(
        () => _i48.LoginBloc(gh<_i34.LoginRepository>()));
    gh.factory<_i49.CreatePassBloc>(
        () => _i49.CreatePassBloc(gh<_i46.CreatePasswordRepository>()));
    gh.factory<_i50.IntroCubit>(() => _i50.IntroCubit(
          getIsFirstRun: gh<_i41.GetIsFirstRun>(),
          setIsFirstRun: gh<_i40.SetIsFirstRun>(),
          router: gh<_i9.AppRouter>(),
        ));
    gh.factory<_i51.SignupRepository>(
        () => _i52.SignupRepositoryImpl(gh<_i42.SignupRemoteDataSource>()));
    gh.factory<_i53.SignupBloc>(
        () => _i53.SignupBloc(gh<_i51.SignupRepository>()));
    gh.factory<_i54.TokenManager>(() => _i54.TokenManager(
          gh<_i15.SettingsManager>(),
          gh<_i44.TokenRepository>(),
          gh<_i13.AppLog>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i55.NetworkModule {}
