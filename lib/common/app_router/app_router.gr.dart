// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../feature/deal_details/view/deal_details_screen.dart' as _i2;
import '../../feature/home/view/home_screen.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    DealDetailsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DealDetailsScreenRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.DealDetailsScreen(
          dealId: args.dealId,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeScreenRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          DealDetailsScreenRoute.name,
          path: '/deal-details-screen',
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i3.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i2.DealDetailsScreen]
class DealDetailsScreenRoute
    extends _i3.PageRouteInfo<DealDetailsScreenRouteArgs> {
  DealDetailsScreenRoute({
    required String dealId,
    _i4.Key? key,
  }) : super(
          DealDetailsScreenRoute.name,
          path: '/deal-details-screen',
          args: DealDetailsScreenRouteArgs(
            dealId: dealId,
            key: key,
          ),
        );

  static const String name = 'DealDetailsScreenRoute';
}

class DealDetailsScreenRouteArgs {
  const DealDetailsScreenRouteArgs({
    required this.dealId,
    this.key,
  });

  final String dealId;

  final _i4.Key? key;

  @override
  String toString() {
    return 'DealDetailsScreenRouteArgs{dealId: $dealId, key: $key}';
  }
}
