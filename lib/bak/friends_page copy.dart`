// import 'package:flutter/material.dart';
// import 'package:flutter_app_learn/src/config/index.dart';
// import 'package:flutter_app_learn/src/provider/friends_provider.dart';
// import 'package:flutter_app_learn/src/utils/toast_util.dart';
// import 'package:flutter_app_learn/src/widgets/favorite_item.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:provider/provider.dart';

// /// Friends
// class FriendsPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _FriendsPageState();
// }

// class _FriendsPageState extends State<FriendsPage>
//     with SingleTickerProviderStateMixin {
//   ScrollController _scrollController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   // 下拉刷新数据
//   Future<Null> _refreshData() async {
//     ToastUtil.showToast(message: "TODO：下拉刷新数据");
//   }

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
//     double width = ScreenUtil.screenWidth;
//     double height = ScreenUtil.screenHeight;
//     print(" ------ FriendsPage $width, $height ------ ");
//     FriendsProvider provider = Provider.of<FriendsProvider>(context);
//     provider.getDefaultFriendInfo();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(MStrings.friendTitle),
//         elevation: 0.0,
//         centerTitle: true,
//         actions: <Widget>[
//           Icon(
//             Icons.account_box,
//             color: Colors.white,
//           ),
//           Icon(Icons.add, color: Colors.white),
//         ],
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: ScreenUtil.getInstance().setHeight(90.0),
//               padding: EdgeInsets.symmetric(
//                   vertical: ScreenUtil.getInstance().setHeight(16.0),
//                   horizontal: ScreenUtil.getInstance().setWidth(16.0)),
//               child: TextField(
//                 decoration: InputDecoration(
//                     contentPadding:
//                         EdgeInsets.all(ScreenUtil.getInstance().setWidth(16.0)),
//                     hintText: "借呗",
//                     border: InputBorder.none,
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                       borderSide: BorderSide(
//                         color: Colors.grey, //边线颜色为黄色
//                         width: 0.5, //边线宽度为2
//                       ),
//                     ),
//                     prefixIcon: Icon(Icons.search)),
//               ),
//             ),
//             Container(
//               height: ScreenUtil.getInstance().setHeight(80.0),
//               padding: EdgeInsets.symmetric(
//                   horizontal: ScreenUtil.getInstance().setWidth(8.0)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text('1'),
//                   Text('2'),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: RefreshIndicator(
//                 child: Container(
//                   padding: EdgeInsets.only(
//                       left: ScreenUtil.getInstance().setWidth(8.0),
//                       right: ScreenUtil.getInstance().setWidth(8.0)),
//                   child: StaggeredGridView.countBuilder(
//                     shrinkWrap: true,
//                     controller: _scrollController,
//                     crossAxisCount: 4,
//                     itemCount: provider.favorites.length,
//                     itemBuilder: (BuildContext context, int index) =>
//                         FavoriteItem(
//                       favoriteInfo: provider.favorites[index],
//                     ),
//                     staggeredTileBuilder: (int index) =>
//                         StaggeredTile.count(2, index.isEven ? 3 : 2.5),
//                     mainAxisSpacing: 4.0,
//                     crossAxisSpacing: 4.0,
//                   ),
//                 ),
//                 onRefresh: _refreshData,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
