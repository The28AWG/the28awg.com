// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'routes.dart';

class _$Routes extends RootStackRouter {
  _$Routes([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    UnknownRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UnknownPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(UnknownRoute.name, path: '/*'),
        RouteConfig(HomeRoute.name, path: '/')
      ];
}

/// generated route for
/// [UnknownPage]
class UnknownRoute extends PageRouteInfo<void> {
  const UnknownRoute() : super(UnknownRoute.name, path: '/*');

  static const String name = 'UnknownRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}
