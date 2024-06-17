import 'package:flutter/material.dart';

import '../features/splash/splash_screen.dart';
import '../features/welcome/welcome_screen.dart';
import 'routes_name.dart';

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return getPageRoute(const SplashScreen());
      case RoutesName.welcome:
        return getPageRoute(const WelcomeScreen());

      default:
        return getPageRoute(const WelcomeScreen());
    }
  }
}
