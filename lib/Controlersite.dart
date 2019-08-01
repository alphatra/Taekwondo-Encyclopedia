import 'package:flutter/material.dart';
import 'package:taekwondo_app/subpages/Patterns.dart';
import 'package:taekwondo_app/subpages/Dictionary.dart';
import 'package:taekwondo_app/subpages/About.dart';
import 'package:taekwondo_app/subpages/Informations.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
void main() => runApp(MyPage());

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: _getPage(currentPage),

        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: IconData(0xe900, fontFamily: 'Open-Book'),
              title: "Dictionary",
          ),
          TabData(iconData: IconData(0xe901, fontFamily: 'Taekwondo-Kick'), title: "Patterns",),
          TabData(iconData: Icons.history, title: "Informations",),
          TabData(iconData: Icons.settings, title: "About us",)
        ],
        activeIconColor: Colors.white,
        inactiveIconColor: Colors.limeAccent[700],
        circleColor: Colors.limeAccent[700],
        initialSelection: 0,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Dictionary();
      case 1:
        return Patterns();
      case 2:
        return History();
      case 3:
        return About();
      default:
        return Dictionary();
    }
  }
}
