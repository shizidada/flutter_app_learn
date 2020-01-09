import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_learn/src/pages/main/home_page.dart';
import 'package:flutter_app_learn/src/pages/main/mime_page.dart';
import 'package:flutter_app_learn/src/pages/main/friends_page.dart';
import 'package:flutter_app_learn/src/pages/main/public_praise_page.dart';
import 'package:flutter_app_learn/src/pages/main/riches_page.dart';

import 'package:flutter_app_learn/src/config/index.dart';
import 'package:flutter_app_learn/src/provider/index_provider.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  final List<Widget> _bodies = [
    HomePage(),
    RichesPage(),
    PublicPraisePage(),
    FriendsPage(),
    MimePage()
  ];

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    IndexProvider provider = Provider.of<IndexProvider>(context);

    return Scaffold(
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
        // onPageChanged: (index) {
        //   provider.changeIndex(index);
        // },
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MColors.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[600],
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentTabIndex,
        items: provider.items,
        onTap: (index) {
          provider.changeIndex(index);
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 1), curve: Curves.ease);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
