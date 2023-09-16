import 'package:flutter/material.dart';
import 'package:islami_app_c9_sat_4pm/moduls/hadeth/hadeth_view.dart';
import 'package:islami_app_c9_sat_4pm/moduls/radio/radio_view.dart';
import 'package:islami_app_c9_sat_4pm/moduls/settings/settings_view.dart';
import 'package:islami_app_c9_sat_4pm/moduls/tasbeh/tasbeh_view.dart';

import '../moduls/quran/quran_view.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home_screen";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  List<Widget> screens = [
    QuranView(),
    HadethView(),
    TasbehView(),
    RadioView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background_light.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Islami"),
        ),
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          backgroundColor: Color(0xFFB7935F),
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: Colors.black, size: 35),
          selectedItemColor: Colors.black,
          unselectedIconTheme: IconThemeData(color: Colors.white, size: 28),
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/quran_icon.png"),
              ),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/hadeth_icon.png"),
              ),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/sebha_icon.png"),
                ),
                label: "Tasbeh"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/radio_icon.png"),
                ),
                label: "Radio"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "Settings"),
          ],
        ),
      ),
    );
  }
}
