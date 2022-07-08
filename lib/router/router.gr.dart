// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../screens/homescreen.dart' as _i1;
import '../screens/viewrepo.dart' as _i2;

class RootRouter extends _i3.RootStackRouter {
  RootRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    Viewrepo.name: (routeData) {
      final args = routeData.argsAs<ViewrepoArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ViewRepo(key: args.key, userRepo: args.userRepo));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i3.RouteConfig(Home.name, path: '/home'),
        _i3.RouteConfig(Viewrepo.name, path: '/viewrepo:userRepo'),
        _i3.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class Home extends _i3.PageRouteInfo<void> {
  const Home() : super(Home.name, path: '/home');

  static const String name = 'Home';
}

/// generated route for
/// [_i2.ViewRepo]
class Viewrepo extends _i3.PageRouteInfo<ViewrepoArgs> {
  Viewrepo({_i4.Key? key, required String userRepo})
      : super(Viewrepo.name,
            path: '/viewrepo:userRepo',
            args: ViewrepoArgs(key: key, userRepo: userRepo));

  static const String name = 'Viewrepo';
}

class ViewrepoArgs {
  const ViewrepoArgs({this.key, required this.userRepo});

  final _i4.Key? key;

  final String userRepo;

  @override
  String toString() {
    return 'ViewrepoArgs{key: $key, userRepo: $userRepo}';
  }
}
