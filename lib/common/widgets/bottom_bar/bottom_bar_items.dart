import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutteronimo/common/app_router/app_router.gr.dart';
import 'package:flutteronimo/gen/assets.gen.dart';
import 'package:flutteronimo/generated/l10n.dart';

enum BottomBarItems {
  deals,
  wishlist,
  profile,
}

extension Title on BottomBarItems {
  String itemLabel({
    Texts? texts,
  }) {
    final t = texts ?? Texts.current;
    switch (this) {
      case BottomBarItems.deals:
        return t.deals_screen_message;
      case BottomBarItems.wishlist:
        return t.wishlist_screen_message;
      case BottomBarItems.profile:
        return t.profile_screen_message;
    }
  }
}

extension Icon on BottomBarItems {
  String itemSvgPath() {
    switch (this) {
      case BottomBarItems.deals:
        return Assets.images.houseIcon;
      case BottomBarItems.wishlist:
        return Assets.images.heartIcon;
      case BottomBarItems.profile:
        return Assets.images.userIcon;
    }
  }
}

extension Navigation on BottomBarItems {
  PageRouteInfo getPath() {
    switch (this) {
      case BottomBarItems.deals:
        return const DealsRoute();
      case BottomBarItems.wishlist:
        return const WishlistRoute();
      case BottomBarItems.profile:
        return const WishlistRoute();
    }
  }
}
