import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_app_learn/src/bloc_app/res/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConvexAppBarScreen extends StatelessWidget {
  const ConvexAppBarScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ConvexAppBar"),
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.white,
          style: TabStyle.custom,
          items: [
            TabItem(
                icon: SvgPicture.asset('assets/icons/tabbar/icon_home.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/tabbar/icon_home.svg',
                  color: MColors.kPrimaryColor,
                ),
                title: 'Home'),
            TabItem(
                icon: SvgPicture.asset('assets/icons/tabbar/icon_discovery.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/tabbar/icon_discovery.svg',
                  color: MColors.kPrimaryColor,
                ),
                title: 'Discovery'),
            TabItem(
                icon: SvgPicture.asset('assets/icons/tabbar/icon_order.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/tabbar/icon_order.svg',
                  color: MColors.kPrimaryColor,
                ),
                title: 'Order'),
            TabItem(
                icon: SvgPicture.asset('assets/icons/tabbar/icon_message.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/tabbar/icon_message.svg',
                  color: MColors.kPrimaryColor,
                ),
                title: 'Message'),
            TabItem(
                icon: SvgPicture.asset('assets/icons/tabbar/icon_mime.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/tabbar/icon_mime.svg',
                  color: MColors.kPrimaryColor,
                ),
                title: 'Profile'),
          ],
          initialActiveIndex: 2, //optional, default as 0
          onTap: (int i) => print('click index=$i'),
        ));
  }
}
