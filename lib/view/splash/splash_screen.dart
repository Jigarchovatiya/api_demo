import 'dart:async';

import 'package:api_demo/utils/routes_name.dart';
import 'package:flutter/material.dart';

import '../../res/constants/app_assets.dart';
import '../../res/global/media_query.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.splashLogo, height: height(context) / 4),
          ],
        ),
      ),
    );
  }
}
