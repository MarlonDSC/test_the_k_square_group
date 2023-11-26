import 'package:flutter/material.dart';
import 'package:test_the_k_square_group/core/services/router/my_router.dart';
import 'package:test_the_k_square_group/core/services/router/my_router_observer.dart';
import 'package:test_the_k_square_group/locator.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Usuarios',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: Mrouter.usersRoute,
      navigatorKey: Mrouter.navigatorKey,
      scaffoldMessengerKey: Mrouter.scaffoldMessengerKey,
      onGenerateRoute: sl<Mrouter>().generateRoute,
       navigatorObservers: [MyRouteObserver()],
    );
  }
}
