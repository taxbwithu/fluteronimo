import 'package:flutter/cupertino.dart';
import 'package:flutteronimo/gen/assets.gen.dart';
import 'package:flutteronimo/generated/l10n.dart';

enum DrawerItem {
  home,
  logout,
}

extension Title on DrawerItem {
  String itemTitle({
    Texts? texts,
  }) {
    final t = texts ?? Texts.current;
    switch (this) {
      case DrawerItem.home:
        return t.home_screen_message;
      case DrawerItem.logout:
        return t.logout_drawer_label;
    }
  }
}

extension Icon on DrawerItem {
  AssetGenImage itemIcon() {
    switch (this) {
      case DrawerItem.home:
        return Assets.images.homeIcon;
      case DrawerItem.logout:
        return Assets.images.logoutIcon;
    }
  }
}

extension LoginLimit on DrawerItem {
  bool requiresLogin() {
    switch (this) {
      case DrawerItem.home:
        return false;
      case DrawerItem.logout:
        return true;
    }
  }
}
