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
    as _i33;
import 'package:maze_app/data_provider/refresh_token/data/repository/token_repository_impl.dart'
    as _i38;
import 'package:maze_app/data_provider/refresh_token/domain/token_repository.dart'
    as _i37;
import 'package:maze_app/data_provider/refresh_token/token_manager.dart'
    as _i46;
import 'package:maze_app/di/injection_container.dart' as _i47;
import 'package:maze_app/feature/auth/create_password/data/data_source/create_password_remote_data_source.dart'
    as _i26;
import 'package:maze_app/feature/auth/create_password/data/data_source/create_password_remote_data_source_impl.dart'
    as _i27;
import 'package:maze_app/feature/auth/create_password/data/repository/create_password_repository_impl.dart'
    as _i40;
import 'package:maze_app/feature/auth/create_password/domain/repository/create_password_repository.dart'
    as _i39;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/data_source/forgot_pass_remote_data_source.dart'
    as _i20;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/data_source/forgot_pass_remote_data_source_impl.dart'
    as _i21;
import 'package:maze_app/feature/auth/create_password/forgot_password/data/repository/forgot_pass_repository_impl.dart'
    as _i25;
import 'package:maze_app/feature/auth/create_password/forgot_password/domain/repository/forgot_pass_repository.dart'
    as _i24;
import 'package:maze_app/feature/auth/create_password/forgot_password/presentation/bloc/forgot_pass_bloc.dart'
    as _i28;
import 'package:maze_app/feature/auth/create_password/presentation/bloc/create_pass_bloc.dart'
    as _i42;
import 'package:maze_app/feature/auth/login/data/data_source/login_remote_data_source.dart'
    as _i18;
import 'package:maze_app/feature/auth/login/data/data_source/login_remote_data_source_impl.dart'
    as _i19;
import 'package:maze_app/feature/auth/login/data/repository/login_repository_impl.dart'
    as _i30;
import 'package:maze_app/feature/auth/login/domain/repository/login_repository.dart'
    as _i29;
import 'package:maze_app/feature/auth/login/presentation/bloc/login_bloc.dart'
    as _i41;
import 'package:maze_app/feature/auth/signing_up/data/data_source/verify_remote_data_source.dart'
    as _i22;
import 'package:maze_app/feature/auth/signing_up/data/data_source/verify_remote_data_source_impl.dart'
    as _i23;
import 'package:maze_app/feature/auth/signing_up/data/repository/verify_repository_impl.dart'
    as _i32;
import 'package:maze_app/feature/auth/signing_up/domain/repository/verify_repository.dart'
    as _i31;
import 'package:maze_app/feature/auth/signing_up/presentation/bloc/verify_bloc.dart'
    as _i34;
import 'package:maze_app/feature/auth/signup/data/data_source/signup_remote_data_source.dart'
    as _i35;
import 'package:maze_app/feature/auth/signup/data/data_source/signup_remote_data_source_impl.dart'
    as _i36;
import 'package:maze_app/feature/auth/signup/data/repository/signup_repository_impl.dart'
    as _i44;
import 'package:maze_app/feature/auth/signup/domain/repository/signup_repository.dart'
    as _i43;
import 'package:maze_app/feature/auth/signup/presentation/bloc/signup_bloc.dart'
    as _i45;
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
    gh.lazySingleton<_i17.DioCaller>(
      () => networkModule
          .provideTokenDioCaller(gh<_i14.Dio>(instanceName: 'token')),
      instanceName: 'token',
    );
    gh.factory<_i24.ForgotPassRepository>(() =>
        _i25.ForgotPassRepositoryImpl(gh<_i20.ForgotPassRemoteDataSource>()));
    gh.lazySingleton<_i17.DioCaller>(
      () => networkModule
          .provideMazeDioCaller(gh<_i14.Dio>(instanceName: 'versioning0')),
      instanceName: 'versioning0',
    );
    gh.factory<_i26.CreatePasswordRemoteDataSource>(() =>
        _i27.CreatePasswordRemoteDataSourceImpl(
            dioCaller: gh<_i17.DioCaller>(instanceName: 'token')));
    gh.factory<_i28.ForgotPassBloc>(
        () => _i28.ForgotPassBloc(gh<_i24.ForgotPassRepository>()));
    gh.factory<_i29.LoginRepository>(
        () => _i30.LoginRepositoryImpl(gh<_i18.LoginRemoteDataSource>()));
    gh.factory<_i31.VerifyRepository>(
        () => _i32.VerifyRepositoryImpl(gh<_i22.VerifyRemoteDataSource>()));
    gh.factory<_i33.TokenRemoteDataSource>(() => _i33.TokenRemoteDataSourceImpl(
        gh<_i17.DioCaller>(instanceName: 'maze')));
    gh.factory<_i34.VerifyBloc>(
        () => _i34.VerifyBloc(gh<_i31.VerifyRepository>()));
    gh.factory<_i35.SignupRemoteDataSource>(() =>
        _i36.SignupRemoteDataSourceImpl(
            dioCaller: gh<_i17.DioCaller>(instanceName: 'maze')));
    gh.factory<_i37.TokenRepository>(
        () => _i38.TokenRepositoryImpl(gh<_i33.TokenRemoteDataSource>()));
    gh.factory<_i39.CreatePasswordRepository>(() =>
        _i40.CreatePasswordRepositoryImpl(
            gh<_i26.CreatePasswordRemoteDataSource>()));
    gh.factory<_i41.LoginBloc>(
        () => _i41.LoginBloc(gh<_i29.LoginRepository>()));
    gh.factory<_i42.CreatePassBloc>(
        () => _i42.CreatePassBloc(gh<_i39.CreatePasswordRepository>()));
    gh.factory<_i43.SignupRepository>(
        () => _i44.SignupRepositoryImpl(gh<_i35.SignupRemoteDataSource>()));
    gh.factory<_i45.SignupBloc>(
        () => _i45.SignupBloc(gh<_i43.SignupRepository>()));
    gh.factory<_i46.TokenManager>(() => _i46.TokenManager(
          gh<_i13.SettingsManager>(),
          gh<_i37.TokenRepository>(),
          gh<_i11.AppLog>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i47.NetworkModule {}
