// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// // import 'package:flutter_swiper/flutter_swiper.dart';

// import 'package:flutter_app_learn/widgets/discover.dart';
// import 'package:flutter_app_learn/widgets/following.dart';
// import 'package:flutter_app_learn/widgets/user.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   TabController _controller;
//   List<Widget> _tabs = [];

//   static List _tabData = [
//     {'text': '首页', 'icon': Icon(Icons.home)},
//     {'text': '关注', 'icon': Icon(Icons.supervisor_account)},
//     {'text': '发现', 'icon': Icon(Icons.pageview)},
//     {'text': '我的', 'icon': Icon(Icons.account_circle)}
//   ];

//   @override
//   void initState() {
//     super.initState();

//     _controller = TabController(
//         initialIndex: 0, vsync: this, length: 4); // 这里的length 决定有多少个底导 submenus

//     for (int i = 0; i < _tabData.length; i++) {
//       _tabs.add(Tab(text: _tabData[i]['text'], icon: _tabData[i]['icon']));
//     }

//     _controller.addListener(() {
//       if (_controller.indexIsChanging) {
//         _onTabChange();
//       }
//     });
//   }

//   void _onTabChange() {
//     if (this.mounted) {
//       this.setState(() {});
//     }
//   }

//   // @override
//   // void dispose() {
//   //   if (this.mounted) {
//   //     controller.dispose();
//   //   }
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TabBarView(
//           controller: _controller,
//           children: <Widget>[Fllowing(), Discover(), User()]),
//       bottomNavigationBar: Material(
//         // color: const Color(0xFFF0EEEF), //底部导航栏主题颜色
//         child: SafeArea(
//           child: Container(
//             height: 60.0,
//             decoration: BoxDecoration(
//               color: const Color(0xFFFFFFF),
//               boxShadow: <BoxShadow>[
//                 BoxShadow(
//                   color: const Color(0xFFFFFFF),
//                   blurRadius: 3.0,
//                   spreadRadius: 2.0,
//                   offset: Offset(-1.0, -1.0),
//                 ),
//               ],
//             ),
//             child: TabBar(
//                 controller: _controller,
//                 indicatorColor: Theme.of(context).alipayColor,
//                 //tab标签的下划线颜色
//                 // labelColor: const Color(0xFF000000),
//                 indicatorWeight: 0.1, // 设置显示下划线 高度
//                 labelColor: Theme.of(context).alipayColor,
//                 unselectedLabelColor: const Color(0xFF8E8E8E),
//                 tabs: _tabs),
//           ),
//         ),
//       ),
//     );
//   }
// }
