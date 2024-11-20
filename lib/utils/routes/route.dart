import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_city_app/utils/routes/route_name.dart';
import 'package:smart_city_app/views/screens/homes/home_screen.dart';
import 'package:smart_city_app/views/screens/logins/login_screen.dart';
import 'package:smart_city_app/views/screens/splashs/splash_screen.dart';

class Routes {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    Map<String, dynamic> args = (settings.arguments ?? <String, dynamic>{}) as Map<String, dynamic>;

    log("Route to : ${settings.name}");

    switch (settings.name) {
      case initialScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      // case profile:
      //   return MaterialPageRoute(builder: (_) => ProfileScreen(profileResponse: args['profileResponse'] as ProfileResponse));
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
                child: Text('No route defined for ${settings.name}')),
          ));
    }
  }
}