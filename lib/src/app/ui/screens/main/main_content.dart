import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/screens/discovery/discovery_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/home/home_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/mime/mime_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/order/order_list_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/other_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ATHMainContent extends StatefulWidget {
  @override
  _ATHMainContentState createState() => _ATHMainContentState();
}

// with TickerProviderStateMixin
class _ATHMainContentState extends State<ATHMainContent> {
  int _currentIndex = 0;

  PageController _pageController;

  List<Widget> _pageBodies = [];

  @override
  void initState() {
    _pageBodies = <Widget>[
      ATHHomeScreen(),
      ATHDiscoveryScreen(),
      ATHOtherScreen(content: ATHStrings.publishTitle),
      ATHOrderListScreen(),
      ATHMimeScreen(),
    ];

    _pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabBarSize = 56.w;

    return Scaffold(
        body: buildPageView(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _onItemSelected(2);
            },
            backgroundColor: Colors.white,
            child: Container(
              width: 56.w,
              height: 56.w,
              child: SvgPicture.asset('assets/app/tab_discovery.svg',
                  color: getBarItemActiveColor(2)),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        _onItemSelected(0);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: tabBarSize,
                            height: tabBarSize,
                            child: SvgPicture.asset('assets/app/tab_home.svg',
                                color: getBarItemActiveColor(0)),
                          ),
                          Text(ATHStrings.homeTitle,
                              style: TextStyle(color: getBarItemActiveColor(0)))
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        _onItemSelected(1);
                      },
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: tabBarSize,
                              height: tabBarSize,
                              child: SvgPicture.asset(
                                  'assets/app/tab_discovery.svg',
                                  color: getBarItemActiveColor(1)),
                            ),
                            Text(ATHStrings.discoveryTitle,
                                style:
                                    TextStyle(color: getBarItemActiveColor(1))),
                          ])),
                  GestureDetector(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[],
                    ),
                    onTap: () {
                      _onItemSelected(2);
                    },
                  ),
                  GestureDetector(
                      onTap: () {
                        _onItemSelected(3);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: tabBarSize,
                            height: tabBarSize,
                            child: SvgPicture.asset(
                                'assets/app/tab_order.svg',
                                color: getBarItemActiveColor(3)),
                          ),
                          Text(ATHStrings.orderTitle,
                              style: TextStyle(color: getBarItemActiveColor(3)))
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        _onItemSelected(4);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: tabBarSize,
                            height: tabBarSize,
                            child: SvgPicture.asset('assets/app/tab_mime.svg',
                                color: getBarItemActiveColor(4)),
                          ),
                          Text(ATHStrings.mimeTitle,
                              style: TextStyle(color: getBarItemActiveColor(4)))
                        ],
                      ))
                ],
              ),
            )));
  }

  void _onItemSelected(dynamic index) {
    if (index == _currentIndex) return;
    print('current $index');
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  Color getBarItemActiveColor(int index) {
    return _currentIndex == index
        ? getBarItemColor(index)
        : ATHColors.normalColor;
  }

  Color getBarItemColor(int index) {
    return ATHColors.primaryColor;
  }

  void _onPageChange(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  PageView buildPageView() {
    return PageView(
      children: _pageBodies,
      controller: _pageController,
      onPageChanged: _onPageChange,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
