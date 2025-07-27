import 'package:auto_route/auto_route.dart';
import 'package:projectr/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: AuthenticationRoute.page),
        AutoRoute(page: OtpRoute.page),
        AutoRoute(page: SetupBusinessProfileRoute.page),
        AutoRoute(page: SetupBusinessLocationRoute.page),
        AutoRoute(page: SetupBusinessDetailRoute.page),
        AutoRoute(page: SetupAvailabilityRoute.page),
        AutoRoute(page: SetupBusinessCompletionRoute.page),
        AutoRoute(page: HomeRoute.page)
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
