import 'package:auto_route/auto_route.dart';
import 'package:flutteronimo/feature/home/view/home_screen.dart';

import '../../feature/deal_details/view/deal_details_screen.dart';

@MaterialAutoRouter(
    replaceInRouteName: "Page,Route,Screen",
    routes: <AutoRoute>[
      AutoRoute(page: HomeScreen, initial: true),
      AutoRoute(page: DealDetailsScreen),
    ])
class $AppRouter {}
