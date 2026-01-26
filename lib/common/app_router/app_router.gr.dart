// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutteronimo/feature/deal_details/view/deal_details_screen.dart'
    as _i1;
import 'package:flutteronimo/feature/home/subscreens/deals/view/deals_screen.dart'
    as _i2;
import 'package:flutteronimo/feature/home/subscreens/profile/view/profile_screen.dart'
    as _i4;
import 'package:flutteronimo/feature/home/subscreens/wishlist/view/wishlist_screen.dart'
    as _i5;
import 'package:flutteronimo/feature/home/view/home_screen.dart' as _i3;

/// generated route for
/// [_i1.DealDetailsScreen]
class DealDetailsRoute extends _i6.PageRouteInfo<DealDetailsRouteArgs> {
  DealDetailsRoute({
    required String dealId,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         DealDetailsRoute.name,
         args: DealDetailsRouteArgs(dealId: dealId, key: key),
         initialChildren: children,
       );

  static const String name = 'DealDetailsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DealDetailsRouteArgs>();
      return _i1.DealDetailsScreen(dealId: args.dealId, key: args.key);
    },
  );
}

class DealDetailsRouteArgs {
  const DealDetailsRouteArgs({required this.dealId, this.key});

  final String dealId;

  final _i7.Key? key;

  @override
  String toString() {
    return 'DealDetailsRouteArgs{dealId: $dealId, key: $key}';
  }
}

/// generated route for
/// [_i2.DealsScreen]
class DealsRoute extends _i6.PageRouteInfo<void> {
  const DealsRoute({List<_i6.PageRouteInfo>? children})
    : super(DealsRoute.name, initialChildren: children);

  static const String name = 'DealsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.DealsScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute({List<_i6.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i5.WishlistScreen]
class WishlistRoute extends _i6.PageRouteInfo<void> {
  const WishlistRoute({List<_i6.PageRouteInfo>? children})
    : super(WishlistRoute.name, initialChildren: children);

  static const String name = 'WishlistRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.WishlistScreen();
    },
  );
}
