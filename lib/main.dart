import 'package:flutter/material.dart';
import 'package:smart_money_app/pages/create_account_page.dart';
import 'package:smart_money_app/pages/home_page.dart';
import 'package:smart_money_app/pages/info_page.dart';
import 'package:smart_money_app/pages/login_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: [
        GoRoute(
          path: 'createAccountPage',
          builder: (BuildContext context, GoRouterState state) {
            return const CreateAccountPage();
          },
        ),
        GoRoute(
          path: 'homePage',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: 'infoPage',
          builder: (BuildContext context, GoRouterState state) {
            return const InfoPage();
          },
        ),
      ],
    ),
  ],
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Smart Money',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

