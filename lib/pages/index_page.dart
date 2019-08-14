import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_learn/config/index.dart';
import 'package:flutter_app_learn/provider/current_index_provide.dart';
import 'package:flutter_app_learn/pages/home_page.dart';
import 'package:flutter_app_learn/pages/favorite_page.dart';
import 'package:flutter_app_learn/pages/camera_page.dart';
import 'package:flutter_app_learn/pages/message_page.dart';
import 'package:flutter_app_learn/pages/mime_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), title: Text(KString.homeTitle)),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite), title: Text(KString.favoriteTitle)),
    BottomNavigationBarItem(
        icon: Icon(Icons.camera), title: Text(KString.cameraTitle)),
    BottomNavigationBarItem(
        icon: Icon(Icons.message), title: Text(KString.messageTitle)),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), title: Text(KString.mimeTitle)),
  ];

  final List<Widget> _bodies = [
    HomePage(),
    FavoritePage(),
    CameraPage(),
    MessagePage(),
    MimePage()
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = Provider.of<CurrentIndexProvide>(context).currentIndex;
    return Consumer<CurrentIndexProvide>(
      builder: (context, child, value) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            items: _items,
            onTap: (index) {
              Provider.of<CurrentIndexProvide>(context).changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: currentIndex,
            children: _bodies,
          ),
        );
      },
    );
  }
}