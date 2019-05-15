import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_app_learn/fragments/discover_fragment/discover_fragment.dart';
import 'package:flutter_app_learn/fragments/following_fragment/following_fragment.dart';
import 'package:flutter_app_learn/fragments/home_fragment/home_fragment.dart';
import 'package:flutter_app_learn/fragments/user_fragment/user_fragment.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  static List tabData = [
    {'text': 'Starred', 'icon': Icon(Icons.home)},
    {'text': 'Following', 'icon': Icon(Icons.supervisor_account)},
    {'text': 'Discover', 'icon': Icon(Icons.pageview)},
    {'text': 'User', 'icon': Icon(Icons.account_circle)}
  ];

  List<Widget> myTabs = [];

  @override
  void initState() {
    super.initState();

    controller = TabController(
        initialIndex: 0, vsync: this, length: 4); // 这里的length 决定有多少个底导 submenus

    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(Tab(text: tabData[i]['text'], icon: tabData[i]['icon']));
    }

    controller.addListener(() {
      if (controller.indexIsChanging) {
        _onTabChange();
      }
    });
  }

  // @override
  // void dispose() {
  //   if (this.mounted) {
  //     controller.dispose();
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: controller, children: <Widget>[
        HomeFragment(),
        FllowingFragment(),
        DiscoverFragment(),
        UserFragment()
      ]),
      bottomNavigationBar: Material(
        // color: const Color(0xFFF0EEEF), //底部导航栏主题颜色
        child: SafeArea(
          child: Container(
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFFd0d0d0),
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                  offset: Offset(-1.0, -1.0),
                ),
              ],
            ),
            child: TabBar(
                controller: controller,
                indicatorColor: Theme.of(context).primaryColor,
                //tab标签的下划线颜色
                // labelColor: const Color(0xFF000000),
                indicatorWeight: 0.1, // 设置显示下划线 高度
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: const Color(0xFF8E8E8E),
                tabs: myTabs),
          ),
        ),
      ),
    );
  }

  void _onTabChange() {
    if (this.mounted) {
      this.setState(() {});
    }
  }
}
