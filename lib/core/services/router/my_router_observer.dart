import 'package:flutter/material.dart';
import 'package:test_the_k_square_group/core/services/router/my_router.dart';
import 'package:test_the_k_square_group/locator.dart';

class MyRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    sl<Mrouter>().updateRoute(route.settings.name ?? '');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    sl<Mrouter>().updateRoute(previousRoute?.settings.name ?? '');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    sl<Mrouter>().updateRoute(newRoute?.settings.name ?? '');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    if (previousRoute?.settings.name != null) {
      sl<Mrouter>().updateRoute(previousRoute?.settings.name ?? '');
    }
  }
}