import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_learn/src/config/index.dart';
import 'package:flutter_app_learn/src/provider/current_index_provide.dart';
import 'package:flutter_app_learn/src/pages/home_page.dart';
import 'package:flutter_app_learn/src/pages/mime_page.dart';
import 'package:flutter_app_learn/src/pages/friends_page.dart';
import 'package:flutter_app_learn/src/pages/public_praise_page.dart';
import 'package:flutter_app_learn/src/pages/riches_page.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  final List<BottomNavigationBarItem> _items = [
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

  final List<Widget> _bodies = [
    HomePage(),
    RichesPage(),
    PublicPraisePage(),
    FriendsPage(),
    MimePage()
  ];

  PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    CurrentIndexProvider provider = Provider.of<CurrentIndexProvider>(context);

    return SafeArea(
      child: Scaffold(
        // body: IndexedStack(
        //   index: provider.currentIndex,
        //   children: _bodies,
        // ),

        body: PageView(
          children: _bodies,
          pageSnapping: false,
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          // allowImplicitScrolling: true,
          onPageChanged: (index) {
            provider.changeIndex(index);
          },
        ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: MColors.primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[600],
          type: BottomNavigationBarType.fixed,
          currentIndex: provider.currentIndex,
          items: _items,
          onTap: (index) {
            // provider.changeIndex(index);
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
