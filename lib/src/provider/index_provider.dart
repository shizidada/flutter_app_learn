import 'package:bottom_navigation_badge/bottom_navigation_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/config/strings.dart';

class IndexProvider with ChangeNotifier {
  int currentTabIndex = 0;

  List<BottomNavigationBarItem> items;

  BottomNavigationBadge badger;

  IndexProvider() {
    print(" ---- IndexProvider ---- ");

    items = [
      BottomNavigationBarItem(
          icon: Icon(Icons.home), title: Text(MStrings.homeTitle)),
      BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on), title: Text(MStrings.richesTitle)),
      BottomNavigationBarItem(
          icon: Icon(Icons.mood), title: Text(MStrings.publicPraiseTitle)),
      BottomNavigationBarItem(
          icon: Icon(Icons.supervisor_account),
          title: Text(MStrings.friendTitle)),
      BottomNavigationBarItem(
          icon: Icon(Icons.person), title: Text(MStrings.mimeTitle)),
    ];

    badger = new BottomNavigationBadge(
        backgroundColor: Colors.red,
        badgeShape: BottomNavigationBadgeShape.circle,
        textColor: Colors.white,
        position: BottomNavigationBadgePosition.topRight,
        textSize: 8);
  }

  changeIndex(int index) {
    this.currentTabIndex = index;
    notifyListeners();
  }

  changeBadge(String content, int index) {
    badger.setBadge(items, content, index);
    notifyListeners();
  }
}
