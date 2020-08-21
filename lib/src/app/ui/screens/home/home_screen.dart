import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/screens/home/home_body.dart';

// with AutomaticKeepAliveClientMixin

// 首页
class ATHHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ATHHomeBody());
  }
}

//CustomScrollView buildCustomScrollView() {
//  return CustomScrollView(slivers: <Widget>[
//    buildSliverAppBar(),
//
//    SliverPadding(
//      padding: const EdgeInsets.all(8.0),
//      sliver: SliverGrid(
//        //Grid
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          //Grid按两列显示
//          crossAxisCount: 2,
//          mainAxisSpacing: 10.px,
//          crossAxisSpacing: 10.px,
//          childAspectRatio: 4.px,
//        ),
//        delegate: SliverChildBuilderDelegate(
//              (BuildContext context, int index) {
//            //创建子widget
//            return Container(
//              alignment: Alignment.center,
//              color: Colors.cyan[100 * (index % 9)],
//              child: Text('grid item $index'),
//            );
//          },
//          childCount: 20,
//        ),
//      ),
//    ),
//    //List
//    SliverFixedExtentList(
//      itemExtent: 100.px,
//      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
//        //创建列表项
//        return Container(
//          alignment: Alignment.center,
//          color: Colors.lightBlue[100 * (index % 9)],
//          child: Text('list item $index'),
//        );
//      }, childCount: 50 //50个列表项
//      ),
//    ),
//  ]);
//}

// _silverBuilder
// SliverPersistentHeader(
//   delegate: _SilverAppBarDelegate(TabBar(
//     controller: tabController,
//     tabs: tabs,
//   )),
// ),
// class _SilverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SilverAppBarDelegate(this._tabBar);

//   final TabBar _tabBar;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;

//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return _tabBar;
//   }

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
