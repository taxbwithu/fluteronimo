import 'package:flutter/material.dart';
import 'package:flutteronimo/common/app_router/app_coordinator.dart';

mixin SplashScreenNavigation {
  final _appCoordinator = AppCoordinator();

  void openDealsScreen({
    required BuildContext context,
  }) {
    _appCoordinator.navigateHome(context: context);
  }

  void openLoginScreen({
    required BuildContext context,
  }) {
    _appCoordinator.navigateToLogin(context: context);
  }
}
