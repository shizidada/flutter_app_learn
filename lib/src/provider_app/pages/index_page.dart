import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/provider_app/pages/main/friends_page.dart';
import 'package:flutter_app_learn/src/provider_app/pages/main/home_page.dart';
import 'package:flutter_app_learn/src/provider_app/pages/main/mime_page.dart';
import 'package:flutter_app_learn/src/provider_app/pages/main/public_praise_page.dart';
import 'package:flutter_app_learn/src/provider_app/pages/main/riches_page.dart';
import 'package:flutter_app_learn/src/provider_app/provider/index_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_learn/src/provider_app/res/index.dart';

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
        backgroundColor: Colors.white,
        selectedItemColor: MColors.alipayColor,
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
