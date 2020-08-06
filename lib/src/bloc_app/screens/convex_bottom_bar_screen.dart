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
                icon: SvgPicture.asset('assets/icons/tab_index.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/tab_index_s.svg',
                  color: MColors.kPrimaryColor,
                ),
                title: 'Home'),
            TabItem(
                icon: SvgPicture.asset('assets/icons/tab_discovery.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/tab_discovery_s.svg',
                  color: MColors.kPrimaryColor,
                ),
                title: 'Discovery'),
            TabItem(
                icon: SvgPicture.asset('assets/icons/tab_order.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/tab_order_s.svg',
                  color: MColors.kPrimaryColor,
                ),
                title: 'Order'),
            TabItem(
                icon: SvgPicture.asset('assets/icons/tab_message.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/tab_message_s.svg',
                  color: MColors.kPrimaryColor,
                ),
                title: 'Message'),
            TabItem(
                icon: SvgPicture.asset('assets/icons/tab_mime.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/tab_mime_s.svg',
                  color: MColors.kPrimaryColor,
                ),
                title: 'Profile'),
          ],
          initialActiveIndex: 2, //optional, default as 0
          onTap: (int i) => print('click index=$i'),
        ));
  }
}
