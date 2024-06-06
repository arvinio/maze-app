import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/versioning/presentation/versioning_page.dart';

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
    AutoRoute(path:'/', page: VersioningPageRoute.page)

  ];
}