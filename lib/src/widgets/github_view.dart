// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_app_learn/models/GitHubStarred.dart';
// import 'package:flutter_app_learn/models/StarredItem.dart';

// import 'package:flutter_app_learn/pages/detail_page.dart';
// import 'package:flutter_app_learn/service/GithubService.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class GithubView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _GithubViewState();
// }

// class _GithubViewState extends State<GithubView>
//     with AutomaticKeepAliveClientMixin {
//   List<StarredItem> _datas = [];

// /*1、IndexedStack 存储页面
// IndexedStack(
//   children: <Widget>[
//     Page1(),
//     Page2(),
//     Page3()
//   ],
//   index: _currentPageIndex,
//  */
// // 2
//   @override
//   bool get wantKeepAlive => true;

//   @override
//   void initState() {
//     super.initState();
//     print("initState");
//     _loadData();
//   }

//   _loadData() {
//     if (_datas.length == 0) {
//       getStarred().then((res) => setState(() {
//             _datas = GitHubStarred.formJson(res.data).githubItem;
//           }));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     Widget childWidget;
//     if (_datas != null && _datas.length != 0) {
//       childWidget = ListView.builder(
//         itemCount: _datas.length,
//         itemBuilder: (contxt, index) {
//           return Card(
//             child: ListTile(
//               leading: Icon(Icons.code),
//               trailing: Icon(Icons.keyboard_arrow_right),
//               title: Text('${_datas[index].fullName}'),
//               subtitle: Text('${_datas[index].name}'),
//               onTap: () => _listTileClick(index),
//               // isThreeLine: true,
//             ),
//           );
//         },
//       );
//     } else {
//       childWidget = Stack(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.0),
//             child: Center(child: SpinKitFadingCircle(
//               itemBuilder: (_, int index) {
//                 return DecoratedBox(
//                   decoration: BoxDecoration(
//                     color: index.isEven ? Colors.black26 : Colors.black38,
//                   ),
//                 );
//               },
//             )),
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
//             child: Center(
//               child: Text('正在加载中，请等待~'),
//             ),
//           ),
//         ],
//       );
//     }
//     return Scaffold(body: childWidget);
//   }

//   _listTileClick(int index) {
//     StarredItem githubItem = _datas[index];
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => DetailPage(githubItem: githubItem)));
//     // Application.router.navigateTo(context, "/detail?githubItem=$githubItem");
//   }
// }
