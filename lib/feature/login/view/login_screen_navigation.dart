import 'package:flutter/material.dart';
import 'package:flutteronimo/common/app_router/app_coordinator.dart';

mixin LoginScreenNavigation {
  final _appCoordinator = AppCoordinator();

  void openHomeScreen({
    required BuildContext context,
  }) {
    _appCoordinator.navigateHome(context: context);
  }
}
