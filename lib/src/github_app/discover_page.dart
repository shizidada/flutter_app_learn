// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_app_learn/src/provider/current_index_provide.dart';
// import 'package:provider/provider.dart';

// class DiscoverPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _DiscoverPageState();
// }

// class _DiscoverPageState extends State<DiscoverPage>
//     with AutomaticKeepAliveClientMixin {
//   int _currentIndex = 0;

//   void _incrementHandle() {
//     IndexProvider currentIndexProvider = Provider.of<IndexProvider>(context);
//     int currentIndex = currentIndexProvider.currentIndex;
//     currentIndex++;
//     currentIndexProvider.changeIndex(currentIndex);

//     setState(() {
//       _currentIndex = currentIndex;
//     });
//     print(currentIndex);
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("DiscoverPage"),
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text("This is the Discover page"),
//           RaisedButton(
//             child: Text("Counter $_currentIndex"),
//             onPressed: () {
//               _incrementHandle();
//             },
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
