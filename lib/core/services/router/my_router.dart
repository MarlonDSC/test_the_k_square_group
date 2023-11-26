import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/user.dart';
import 'package:test_the_k_square_group/ui/pages/profile_page.dart';
import 'package:test_the_k_square_group/ui/pages/user_page.dart';

class Mrouter {
  final BehaviorSubject<String> _currentRouteSubject = BehaviorSubject();

  StreamSink<String> get _currentRouteSink => _currentRouteSubject.sink;

  Stream<String> get currentRouteStream => _currentRouteSubject.stream;

  String get currentRoute => _currentRouteSubject.value;

  bool get hasContext => navigatorKey.currentContext != null;

  bool get mounted => navigatorKey.currentState != null;

  void closeStream() => _currentRouteSubject.close();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey();

  static const String usersRoute = '/';
  static const String singleUserRoute = '/single_user';

  void updateRoute(String routeName) {
    _currentRouteSink.add(routeName);
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case usersRoute:
        return MaterialPageRoute(
          builder: (ctx) => const UserPage(),
          settings: const RouteSettings(name: usersRoute),
        );
      case singleUserRoute:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        User user = args['user'] as User;
        return MaterialPageRoute(
          builder: (ctx) => ProfilePage(user: user),
          settings: const RouteSettings(name: usersRoute),
        );
      default:
        return MaterialPageRoute(
          builder: (ctx) => NoRouteScreen(settings.name!),
        );
    }
  }

  static Future pushNamed(String route, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(route, arguments: arguments);
  }

  static Future pushReplacementNamed(String route, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(route, arguments: arguments);
  }

  static Future pushNamedAndRemoveUntil(String pushRoute,
      {String? untilRoute, Object? arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      pushRoute,
      untilRoute != null
          ? ModalRoute.withName(untilRoute)
          : (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static dynamic pop([Object? result]) {
    return navigatorKey.currentState?.pop(result);
  }

  static dynamic maybePop([Object? result]) {
    return navigatorKey.currentState?.maybePop(result);
  }

  static dynamic canPop() {
    return navigatorKey.currentState?.canPop();
  }

  static void popUntilNamed(String untilRoute) {
    return navigatorKey.currentState?.popUntil((route) {
      return route.settings.name == untilRoute;
    });
  }

  static void popUntil(bool Function(Route<dynamic>) predicate) {
    return navigatorKey.currentState?.popUntil(predicate);
  }
}

class NoRouteScreen extends StatelessWidget {
  final String routeName;

  const NoRouteScreen(this.routeName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Ruta no definida para: $routeName'),
      ),
    );
  }
}
