import 'package:flutter/cupertino.dart';
import 'package:flutteronimo/common/app_router/app_coordinator.dart';

import 'data_model/drawer_item.dart';

class CustomDrawerVm {
  final AppCoordinator _appCoordinator = AppCoordinator();
  DrawerItem currentItem;

  CustomDrawerVm({
    required this.currentItem,
  });

  void navigateByItem({
    required DrawerItem item,
    required BuildContext context,
  }) {
    currentItem = item;
    switch (item) {
      case DrawerItem.home:
        _navigateHome(context: context);
        break;
      case DrawerItem.logout:
        print("logout has been tapped");
        break;
    }
  }

  void _navigateHome({
    required BuildContext context,
  }) {
    _appCoordinator.navigateHome(context: context);
  }

  bool isUserLogged() {
    // TODO 23.01.2023 MM add user logged verification
    return false;
  }
}
