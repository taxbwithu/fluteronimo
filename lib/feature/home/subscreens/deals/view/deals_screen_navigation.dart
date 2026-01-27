import 'package:flutter/material.dart';
import 'package:flutteronimo/common/app_router/app_coordinator.dart';

mixin DealsScreenNavigation {
  final _appCoordinator = AppCoordinator();

  void openDealDetails({
    required BuildContext context,
    required String dealId,
  }) {
    _appCoordinator.navigateToDealDetails(context: context, dealId: dealId);
  }
}
