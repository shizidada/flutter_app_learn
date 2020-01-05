import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_learn/src/config/index.dart';
import 'package:flutter_app_learn/src/provider/current_index_provide.dart';
import 'package:flutter_app_learn/src/pages/home_page.dart';
import 'package:flutter_app_learn/src/pages/favorite_page.dart';
import 'package:flutter_app_learn/src/pages/vip_page.dart';
import 'package:flutter_app_learn/src/pages/message_page.dart';
import 'package:flutter_app_learn/src/pages/mime_page.dart';

class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), title: Text(MStrings.homeTitle)),
    BottomNavigationBarItem(
        icon: Icon(Icons.view_compact), title: Text(MStrings.vipTitle)),
    BottomNavigationBarItem(
        icon: Icon(Icons.message), title: Text(MStrings.messageTitle)),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite), title: Text(MStrings.favoriteTitle)),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), title: Text(MStrings.mimeTitle)),
  ];

  final List<Widget> _bodies = [
    HomePage(),
    VipPage(),
    MessagePage(),
    FavoritePage(),
    MimePage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    CurrentIndexProvider provider = Provider.of<CurrentIndexProvider>(context);
    return Consumer<CurrentIndexProvider>(
      builder: (context, child, value) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[600],
            type: BottomNavigationBarType.fixed,
            currentIndex: provider.currentIndex,
            items: _items,
            onTap: (index) {
              provider.changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: provider.currentIndex,
            children: _bodies,
          ),
        );
      },
    );
  }
}
