// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:user_app/presentation/screens/home/home.dart';
import 'package:user_app/presentation/screens/splash/splash.dart';
import 'package:user_app/presentation/screens/user/user.dart';

class RouteNames {
  static const String SPLASH_SCREEN = '/';
  static const String HOME_SCREEN = '/home';
  static const String USER_SCREEN = '/user';
}

class AppRoute {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.SPLASH_SCREEN:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteNames.USER_SCREEN:
        final arguments = routeSettings.arguments as ScreenArgs;
        return MaterialPageRoute(
            builder: (_) => UserScreen(user: arguments.args['user']));
      default:
        return null;
    }
  }
}

class ScreenArgs {
  final Map<String, dynamic> args;

  const ScreenArgs(this.args);
}
