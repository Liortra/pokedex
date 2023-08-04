import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pokemon/presentation/screen/home/home_page.dart';
import 'package:pokemon/presentation/screen/splash_page.dart';

import 'app_routes.dart';

class RouteGenerator{
  final Logger logger = Logger();

  Route<dynamic> generateRoute(RouteSettings settings, navigatorKey){
    final args = settings.arguments;
    logger.i('Navigating to ${settings.name}');
    switch (settings.name) {
      case Routes.HomePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case Routes.SplashPage:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      default:
        return _errorRoute(args);
    }
  }


  Route<dynamic> _errorRoute(Object? args) {
    Logger().e("Error navigating to a new page ${args.toString()}");
    return MaterialPageRoute(
      builder: (_) {
        return const HomePage();
      },
    );
  }

}