import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/screens/discovery/discovery_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/home/home_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/mime/mime_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/order/order_list_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/other_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ATHMainBody extends StatefulWidget {
  @override
  _ATHMainBodyState createState() => _ATHMainBodyState();
}

// with TickerProviderStateMixin
class _ATHMainBodyState extends State<ATHMainBody> {
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
        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 6.h, 0, 6.h),
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
                            child: SvgPicture.asset('assets/icons/tabbar/tab_home.svg',
                                color: getBarItemActiveColor(0)),
                          ),
                          Text(ATHStrings.homeTitle,
                              style: TextStyle(
                                  color: getBarItemActiveColor(0),
                                  fontSize: 20.sp))
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
                                  'assets/icons/tabbar/tab_order.svg',
                                  color: getBarItemActiveColor(1)),
                            ),
                            Text(ATHStrings.orderTitle,
                                style: TextStyle(
                                    color: getBarItemActiveColor(1),
                                    fontSize: 20.sp)),
                          ])),
                  GestureDetector(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: tabBarSize,
                          height: tabBarSize,
                          child: SvgPicture.asset(
                              'assets/icons/tabbar/tab_discovery.svg',
                              color: getBarItemActiveColor(2)),
                        ),
                        Text(ATHStrings.discoveryTitle,
                            style: TextStyle(
                                color: getBarItemActiveColor(2),
                                fontSize: 20.sp)),
                      ],
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
                            child: SvgPicture.asset('assets/icons/tabbar/tab_message.svg',
                                color: getBarItemActiveColor(3)),
                          ),
                          Text(ATHStrings.messageTitle,
                              style: TextStyle(
                                  color: getBarItemActiveColor(3),
                                  fontSize: 20.sp))
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
                            child: SvgPicture.asset('assets/icons/tabbar/tab_mime.svg',
                                color: getBarItemActiveColor(4)),
                          ),
                          Text(ATHStrings.mimeTitle,
                              style: TextStyle(
                                  color: getBarItemActiveColor(4),
                                  fontSize: 20.sp))
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
