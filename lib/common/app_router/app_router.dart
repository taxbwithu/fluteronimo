import 'package:auto_route/auto_route.dart';
import 'package:flutteronimo/feature/home/view/home_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route,Screen",
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
  ]
)
class $AppRouter {}