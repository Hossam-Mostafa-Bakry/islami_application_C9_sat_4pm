import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app_c9_sat_4pm/layout/home_layout.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash_screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacementNamed(context, HomeLayout.routeName);
      },
    );

    return Scaffold(
      body: Image.asset(
        "assets/images/splash_screen.png",
        height: mediaQuery.height,
        width: mediaQuery.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
