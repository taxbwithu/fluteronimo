import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutteronimo/common/app_router/app_router.gr.dart';

class AppCoordinator {
  popLast<T extends Object?>({
    required BuildContext context,
    T? result,
  }) {
    context.router.pop(result);
  }

  navigateHome({
    required BuildContext context,
  }) {
    context.router.replaceAll([const HomeScreenRoute()]);
  }
}
