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
    PreLoginPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PreLoginPage(),
      );
    },
    VersioningPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const VersioningPage()),
      );
    },
  };
}

/// generated route for
/// [PreLoginPage]
class PreLoginPageRoute extends PageRouteInfo<void> {
  const PreLoginPageRoute({List<PageRouteInfo>? children})
      : super(
          PreLoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreLoginPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VersioningPage]
class VersioningPageRoute extends PageRouteInfo<void> {
  const VersioningPageRoute({List<PageRouteInfo>? children})
      : super(
          VersioningPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'VersioningPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
