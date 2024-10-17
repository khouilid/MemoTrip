import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AdaptiveRoute(page: SplashRoute.page, initial: true, path: "/spalsh"),
    // AdaptiveRoute(page: SignInRoute.page, path: "/sign-in"),
    // HomePage
    AdaptiveRoute(page: HomeRoute.page, path: "/home"),
    // ImageViewerScreen
    AdaptiveRoute(page: ImageViewerRoute.page, path: "/image-viewer"),
  ];
}
