import 'package:flutter/material.dart';
import 'package:islami_app_c9_sat_4pm/core/theme/application_theme.dart';
import 'package:islami_app_c9_sat_4pm/layout/home_layout.dart';
import 'package:islami_app_c9_sat_4pm/moduls/quran/quran_details.dart';
import 'package:islami_app_c9_sat_4pm/splash_screen.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeLayout.routeName: (context) => HomeLayout(),
        QuranDetails.routeName: (context) => QuranDetails(),
      },
    );
  }
}
