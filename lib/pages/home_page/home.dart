import "package:flutter/material.dart";

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter_app_learn/fragments/home_fragment/home_fragment.dart';
import 'package:flutter_app_learn/fragments/constact_fragment/constact_fragment.dart';
import 'package:flutter_app_learn/fragments/discover_fragment/discover_fragment.dart';
import 'package:flutter_app_learn/fragments/settings_fragment/settings_fragment.dart';

/// https://www.jianshu.com/p/9e5f4c81cc7d

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.supervisor_account, title: "Constact"),
          TabData(iconData: Icons.pageview, title: "Discover"),
          TabData(iconData: Icons.account_circle, title: "Setting")
        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[Text("Hello"), Text("World")],
        ),
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return HomeFragment();
      case 1:
        return ConstactFragment();
      case 2:
        return DiscoverFragment();
      case 3:
        return SettingFragment(
          globalKey: bottomNavigationKey,
        );
      default:
    }
  }
}

// floatingActionButton: FloatingActionButton(
//   onPressed: _incrementCounter,
//   tooltip: 'Increment',
//   child: Icon(Icons.add),
// ),
