// import 'package:flutter/material.dart';
// import 'package:flutter_app_learn/src/base/base_page_state.dart';
// import 'package:flutter_app_learn/src/widgets/list_item.dart';
// import 'package:flutter_app_learn/src/widgets/top_bar_clipper.dart';
// import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:url_launcher/url_launcher.dart';

// /// 我
// class MimePage extends BasePage {
//   @override
//   State<StatefulWidget> createState() => _MimePageState();
// }

// class _MimePageState<MimePage> extends BasePageState
//     with SingleTickerProviderStateMixin {
//   _MimePageState() {
//     title = Text(
//       '我的',
//       style: TextStyle(color: Colors.white),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget buildBody(context) {
//     ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

//     double width = ScreenUtil.screenWidth;
//     double height = ScreenUtil.screenHeight;

//     return Stack(
//       children: <Widget>[
//         Container(
//           height: height,
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   color: Theme.of(context).primaryColor,
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         EasyRefresh.custom(
//           slivers: <Widget>[
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 // 顶部栏
//                 Stack(
//                   children: <Widget>[
//                     Container(
//                       width: width,
//                       height: ScreenUtil.getInstance().setHeight(220.0),
//                       color: Colors.white,
//                     ),
//                     ClipPath(
//                       clipper: TopBarClipper(ScreenUtil.screenWidth,
//                           ScreenUtil.getInstance().setHeight(200.0)),
//                       child: SizedBox(
//                         width: width,
//                         height: ScreenUtil.getInstance().setHeight(200.0),
//                         child: Container(
//                           width: width,
//                           height: ScreenUtil.getInstance().setHeight(240.0),
//                           color: Theme.of(context).primaryColor,
//                         ),
//                       ),
//                     ),
//                     // 名字
//                     Container(
//                       margin: EdgeInsets.only(
//                           top: ScreenUtil.getInstance().setHeight(16.0)),
//                       child: Center(
//                         child: Text(
//                           'Tom',
//                           style: TextStyle(
//                               fontSize: ScreenUtil.getInstance().setSp(40.0),
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     // 图标
//                     Container(
//                       margin: EdgeInsets.only(
//                           top: ScreenUtil.getInstance().setHeight(100.0)),
//                       child: Center(
//                           child: Container(
//                         width: ScreenUtil.getInstance().setWidth(100.0),
//                         height: ScreenUtil.getInstance().setWidth(100.0),
//                         child: PreferredSize(
//                           child: Container(
//                             child: ClipOval(
//                               child: Container(
//                                 color: Colors.white,
//                                 child: Icon(Icons.book),
//                               ),
//                             ),
//                           ),
//                           preferredSize: Size(
//                               ScreenUtil.getInstance().setWidth(180.0),
//                               ScreenUtil.getInstance().setWidth(180.0)),
//                         ),
//                       )),
//                     ),
//                   ],
//                 ),
//                 // 内容
//                 Container(
//                   // width: width,
//                   color: Colors.white,
//                   padding:
//                       EdgeInsets.all(ScreenUtil.getInstance().setWidth(8.0)),
//                   child: Card(
//                       color: Colors.green,
//                       child: Container(
//                         padding: EdgeInsets.all(
//                             ScreenUtil.getInstance().setWidth(8.0)),
//                         child: Column(
//                           children: <Widget>[
//                             ListItem(
//                               icon: Icon(
//                                 Icons.person,
//                                 color: Colors.white,
//                               ),
//                               title: 'name',
//                               titleColor: Colors.white,
//                               describe: 'Tom',
//                               describeColor: Colors.white,
//                             ),
//                             ListItem(
//                               icon: EmptyIcon(),
//                               title: 18.toString(),
//                               titleColor: Colors.white,
//                               describe: 'ting hao de',
//                               describeColor: Colors.white,
//                             ),
//                             ListItem(
//                               icon: EmptyIcon(),
//                               title: 'nb',
//                               titleColor: Colors.white,
//                               describe: '                                                                                                     ',
//                               describeColor: Colors.white,
//                             )
//                           ],
//                         ),
//                       )),
//                 ),
//                 Container(
//                   width: width,
//                   color: Colors.white,
//                   padding:
//                       EdgeInsets.all(ScreenUtil.getInstance().setWidth(8.0)),
//                   child: Card(
//                       color: Colors.blue,
//                       child: Container(
//                         padding: EdgeInsets.all(
//                             ScreenUtil.getInstance().setWidth(8.0)),
//                         child: Column(
//                           children: <Widget>[
//                             ListItem(
//                               icon: Icon(
//                                 Icons.supervised_user_circle,
//                                 color: Colors.white,
//                               ),
//                               title: 'group',
//                               titleColor: Colors.white,
//                               describe: '1234567890',
//                               describeColor: Colors.white,
//                               onPressed: () {
//                                 launch('');
//                               },
//                             ),
//                             ListItem(
//                               icon: Icon(
//                                 Icons.http,
//                                 color: Colors.white,
//                               ),
//                               title: 'github',
//                               titleColor: Colors.white,
//                               describe: 'https://github.com/tom',
//                               describeColor: Colors.white,
//                               onPressed: () {
//                                 launch('https://github.com/tom');
//                               },
//                             )
//                           ],
//                         ),
//                       )),
//                 ),
//                 Container(
//                   width: width,
//                   color: Colors.white,
//                   padding:
//                       EdgeInsets.all(ScreenUtil.getInstance().setWidth(8.0)),
//                   child: Card(
//                       color: Colors.teal,
//                       child: Container(
//                         padding: EdgeInsets.all(
//                             ScreenUtil.getInstance().setWidth(8.0)),
//                         child: Column(
//                           children: <Widget>[
//                             ListItem(
//                               icon: Icon(
//                                 Icons.phone,
//                                 color: Colors.white,
//                               ),
//                               title: 'phone',
//                               titleColor: Colors.white,
//                               describe: '18888888888',
//                               describeColor: Colors.white,
//                             ),
//                             ListItem(
//                               icon: Icon(
//                                 Icons.email,
//                                 color: Colors.white,
//                               ),
//                               title: 'email',
//                               titleColor: Colors.white,
//                               describe: 'tom@163.com',
//                               describeColor: Colors.white,
//                               onPressed: () {
//                                 launch(
//                                     'mailto:tom@163.com?subject=EasyRefresh&body=I found a bug');
//                               },
//                             )
//                           ],
//                         ),
//                       )),
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
