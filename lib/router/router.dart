import 'package:auto_route/auto_route.dart';
import 'package:webspark_shortest_way/pages/pages.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: ResultListRoute.page),
        AutoRoute(page: PreviewRoute.page),
        AutoRoute(page: ProcessRoute.page),
  ];
}
