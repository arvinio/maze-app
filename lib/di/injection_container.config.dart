// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;
import 'package:maze_app/core/config/assets/assets.dart' as _i8;
import 'package:maze_app/core/config/strings.dart' as _i4;
import 'package:maze_app/core/network/dio_caller.dart' as _i11;
import 'package:maze_app/core/presentation/route/app_router.dart' as _i5;
import 'package:maze_app/core/style/app_color.dart' as _i6;
import 'package:maze_app/core/style/app_theme.dart' as _i10;
import 'package:maze_app/di/injection_container.dart' as _i17;
import 'package:maze_app/feature/versioning/data/data_source/versioning_remote_data_source.dart'
    as _i12;
import 'package:maze_app/feature/versioning/data/data_source/versioning_remote_data_source_impl.dart'
    as _i13;
import 'package:maze_app/feature/versioning/data/repository/versioning_repository_impl.dart'
    as _i15;
import 'package:maze_app/feature/versioning/domain/repository/versioning_repository.dart'
    as _i14;
import 'package:maze_app/feature/versioning/presentation/bloc/versioning_bloc.dart'
    as _i16;
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
    gh.lazySingleton<_i4.StringsBase>(() => _i4.StringsBase());
    gh.lazySingleton<_i5.AppRouter>(() => _i5.AppRouter());
    gh.lazySingleton<_i6.AppColorsBase>(() => _i6.AppColorsBase());
    gh.lazySingleton<_i7.Logger>(() => networkModule.logger);
    gh.lazySingleton<_i8.AssetsBase>(() => _i8.AssetsBase());
    gh.lazySingleton<_i9.Dio>(
      () => networkModule.provideMazeDio(gh<_i3.PrettyDioLogger>()),
      instanceName: 'versioning0',
    );
    gh.factory<_i10.AppTheme>(
        () => _i10.AppTheme(appColors: gh<_i6.AppColorsBase>()));
    gh.lazySingleton<_i11.DioCaller>(
      () => networkModule
          .provideMazeDioCaller(gh<_i9.Dio>(instanceName: 'versioning0')),
      instanceName: 'versioning0',
    );
    gh.factory<_i12.VersioningRemoteDataSource>(() =>
        _i13.VersioningRemoteDataSourceImpl(
            dioCaller: gh<_i11.DioCaller>(instanceName: 'versioning0')));
    gh.factory<_i14.VersioningRepository>(() =>
        _i15.VersioningRepositoryImpl(gh<_i12.VersioningRemoteDataSource>()));
    gh.factory<_i16.VersioningBloc>(
        () => _i16.VersioningBloc(gh<_i14.VersioningRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i17.NetworkModule {}
