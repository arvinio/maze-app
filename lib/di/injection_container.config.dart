// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:maze_app/core/config/assets.dart' as _i5;
import 'package:maze_app/core/presentation/route/app_router.dart' as _i3;
import 'package:maze_app/core/style/app_color.dart' as _i4;
import 'package:maze_app/core/style/app_theme.dart' as _i6;

const String _dev = 'dev';

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
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.lazySingleton<_i4.AppColorsBase>(
      () => _i4.AppColors(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i5.AssetsBase>(
      () => _i5.Assets(),
      registerFor: {_dev},
    );
    gh.factory<_i6.AppTheme>(
        () => _i6.AppTheme(appColors: gh<_i4.AppColorsBase>()));
    return this;
  }
}
