import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/screens/home_screen.dart';
import 'package:flutter_app_learn/src/app/screens/mime_screen.dart';
import 'package:flutter_app_learn/src/app/screens/order_list_screen.dart';
import 'package:flutter_app_learn/src/app/screens/other_screen.dart';
import 'package:flutter_app_learn/src/app/res/values/size.dart';
import 'package:flutter_app_learn/src/app/utils/screen_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_app_learn/src/app/res/values/colors.dart';
import 'package:flutter_app_learn/src/app/res/values/strings.dart';
import 'package:flutter_app_learn/src/app/res/values/theme.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;

  int _counter = 0;

  PageController _pageController;

  List<Widget> body = [];

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    body = <Widget>[
      HomeScreen(),
      OrderListScreen(),
      OtherScreen(content: AppStrings.kPublishTitle),
      OtherScreen(content: AppStrings.kMessageTitle),
      MimeScreen(),
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
    //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 750, height: 1334);
    return buildScaffoldContainer();
  }

  Scaffold buildBottomNavyBarContainer() {
    return Scaffold(
        body: buildPageView(),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: buildBottomNavyBar());
  }

  Widget buildScaffoldContainer() {
    return Scaffold(
        body: buildPageView(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _onItemSelected(2);
            },
            backgroundColor: AppColors.kPrimaryColor,
            child: Icon(
              Icons.add,
              color: Colors.white,
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
                          Icon(Icons.home, color: getBarItemActiveColor(0)),
                          Text(AppStrings.kHomeTitle,
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
                            Icon(Icons.access_time,
                                color: getBarItemActiveColor(1)),
                            Text(AppStrings.kOrderTitle,
                                style:
                                    TextStyle(color: getBarItemActiveColor(1))),
                          ])),
                  GestureDetector(
                      onTap: () {
                        _onItemSelected(2);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            height: AppScreen.setHeight(48),
                          ),
                          Text(AppStrings.kPublishTitle,
                              style: TextStyle(color: AppColors.kPrimaryColor))
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        _onItemSelected(3);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.mail, color: getBarItemActiveColor(3)),
                          Text(AppStrings.kMessageTitle,
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
                          Icon(Icons.person, color: getBarItemActiveColor(4)),
                          Text(AppStrings.kMimeTitle,
                              style: TextStyle(color: getBarItemActiveColor(4)))
                        ],
                      ))
                ],
              ),
            )));
  }

  Widget buildBottomNavyBar() {
    num tabItemSize = AppSize.tabSize;
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      showElevation: true, // use this to remove appBar's elevation
      onItemSelected: _onItemSelected,
      items: [
        BottomNavyBarItem(
          icon: Container(
            width: tabItemSize,
            height: tabItemSize,
            child: SvgPicture.asset(
              'assets/icons/tab_index.svg',
              color: getBarItemActiveColor(0),
            ),
          ),
          title: Text(AppStrings.kHomeTitle),
          activeColor: getBarItemActiveColor(0),
        ),
        BottomNavyBarItem(
            icon: Container(
              width: tabItemSize,
              height: tabItemSize,
              child: SvgPicture.asset(
                'assets/icons/tab_discovery.svg',
                color: getBarItemActiveColor(1),
              ),
            ),
            title: Text(AppStrings.kOrderTitle),
            activeColor: getBarItemActiveColor(1)),
        BottomNavyBarItem(
            icon: Container(
              width: tabItemSize,
              height: tabItemSize,
              child: SvgPicture.asset(
                'assets/icons/tab_order.svg',
                color: getBarItemActiveColor(2),
              ),
            ),
            title: Text(AppStrings.kOrderTitle),
            activeColor: getBarItemActiveColor(2)),
        BottomNavyBarItem(
            icon: Container(
              width: tabItemSize,
              height: tabItemSize,
              child: SvgPicture.asset(
                'assets/icons/tab_message.svg',
                color: getBarItemActiveColor(3),
              ),
            ),
            title: Text(AppStrings.kMessageTitle),
            activeColor: getBarItemActiveColor(3)),
        BottomNavyBarItem(
            icon: Container(
              width: tabItemSize,
              height: tabItemSize,
              child: SvgPicture.asset(
                'assets/icons/tab_mime.svg',
                color: getBarItemActiveColor(4),
              ),
            ),
            title: Text(AppStrings.kMimeTitle),
            activeColor: getBarItemActiveColor(4)),
      ],
    );
  }

  PageView buildPageView() {
    return PageView(
      children: body,
      controller: _pageController,
      onPageChanged: _onPageChange,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Color getBarItemActiveColor(int index) {
    return _currentIndex == index ? getBarItemColor(index) : Colors.grey;
  }

  Color getBarItemColor(int index) {
    return AppColors.kPrimaryColor;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onPageChange(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  void _onItemSelected(dynamic index) {
    if (index == _currentIndex) return;
    print('current $index');
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
      // _pageController.animateToPage(index,
      //     duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }
}
