import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: SplashRoute.page, initial: true)
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
