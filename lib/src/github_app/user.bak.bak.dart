// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_app_learn/models/GithubUser.dart';
// import 'package:flutter_app_learn/service/GithubService.dart';

// class UserPage extends StatefulWidget {
//   // MeFragment({Key key, this.globalKey}) : super(key: key);
//   // final GlobalKey globalKey;

//   @override
//   State<StatefulWidget> createState() => _UserPageState();
// }

// class _UserPageState extends State<UserPage> with AutomaticKeepAliveClientMixin {
//   GitHubUser user;

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   _loadData() {
//     if (user == null) {
//       getUsers().then((res) => setState(() {
//             user = GitHubUser.fromJson(res.data);
//           }));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);

//     Widget childWidget;
//     if (user != null) {
//       childWidget = Column(
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           Card(
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(6.0),
//                     child: Image.network(
//                       user.avatarUrl,
//                       width: 80,
//                       height: 80,
//                       color: Colors.red,
//                       colorBlendMode: BlendMode.dstIn,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         user.name,
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       Text(user.bio)
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Card(
//             child: Container(
//               height: 50,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   Text("name: " + user.login),
//                   Text('followers: ' + user.followers.toString()),
//                   Text('following: ' + user.following.toString()),
//                 ],
//               ),
//             ),
//           ),
//           Card(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 30,
//                   margin: EdgeInsets.all(10),
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "主页   " + user.htmlUrl,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       );
//     } else {
//       childWidget = Text("数据加载中...");
//     }
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("User"),
//         ),
//         body: childWidget);
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
