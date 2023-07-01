import 'package:api_demo/utils/routes_name.dart';
import 'package:api_demo/view/home/home_screen.dart';
import 'package:api_demo/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> appRoutes = {
  RoutesName.splashScreen: (context) => const SplashScreen(),
  RoutesName.homeScreen: (context) => const HomeScreen(),
  // RoutesName.logInScreen: (context) => const LogInScreen(),
};
