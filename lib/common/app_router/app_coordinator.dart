import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutteronimo/common/app_router/app_router.gr.dart';

class AppCoordinator {
  popLast<T extends Object?>({
    required BuildContext context,
    T? result,
  }) {
    context.router.maybePop(result);
  }

  navigateHome({
    required BuildContext context,
  }) {
    context.router.replaceAll([const DealsRoute()]);
  }

  navigateToDealDetails({
    required BuildContext context,
    required String dealId,
  }) {
    context.router.push(DealDetailsRoute(dealId: dealId));
  }

  navigateToLogin({
    required BuildContext context,
  }) {
    context.router.push(const LoginRoute());
  }

  logout({
    required BuildContext context,
  }) {
    context.router.replaceAll([const LoginRoute()]);
  }
}
