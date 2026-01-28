import 'package:auto_route/auto_route.dart';
import 'package:flutteronimo/common/app_router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true,),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(page: DealsRoute.page),
            AutoRoute(page: WishlistRoute.page),
          ],
        ),
        AutoRoute(page: DealDetailsRoute.page),
        AutoRoute(page: LoginRoute.page),
      ];
}
