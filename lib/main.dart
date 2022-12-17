import 'package:charityapp/screens/americanRedCross.dart';
import 'package:charityapp/screens/cart.dart';
import 'package:charityapp/screens/doctorsWithoutBorders.dart';
import 'package:charityapp/screens/homescreen.dart';
import 'package:charityapp/screens/natureResourcesDefence.dart';
import 'package:charityapp/screens/thenatureconservancy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'doctorsWithoutBorders',
          builder: (BuildContext context, GoRouterState state) {
            return const DoctorsWithoutBorders();
          },
        ),
        GoRoute(
            path: 'cart',
            builder: (BuildContext context, GoRouterState state) {
              return const Cart();
            }),
        GoRoute(
          path: 'americanRedCross',
          builder: (BuildContext context, GoRouterState state) {
            return const AmericanRedCross();
          },
        ),
        GoRoute(
          path: 'theNatureConservancy',
          builder: (BuildContext context, GoRouterState state) {
            return const TheNatureConservancy();
          },
        ),
        GoRoute(
          path: 'natureResourcesDefence',
          builder: (BuildContext context, GoRouterState state) {
            return const NatureResourcesDefence();
          },
        ),
      ],
    ),
  ],
);
