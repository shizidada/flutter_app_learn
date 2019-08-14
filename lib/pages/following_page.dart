import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_app_learn/models/floowing_item.dart';
import 'package:flutter_app_learn/models/github_fllowing.dart';

import 'package:flutter_app_learn/service/github_service.dart';

import 'package:flutter_app_learn/pages/webview_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FllowingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FllowingPageState();
}

class _FllowingPageState extends State<FllowingPage>
    with AutomaticKeepAliveClientMixin {
  List<FloowingItem> fllowingItems;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    getFollowing().then((res) => setState(() {
          fllowingItems = GithubFllowing.formJson(res.data).fllowingItems;
        }));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget childWidget;
    if (fllowingItems != null && fllowingItems.length != 0) {
      childWidget = ListView.builder(
        itemCount: fllowingItems.length,
        itemBuilder: (contxt, index) {
          return Card(
            child: ListTile(
              leading: Image.network(fllowingItems[index].avatarUrl),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text('${fllowingItems[index].login}'),
              subtitle: Text('${fllowingItems[index].htmlUrl}'),
              onTap: () => _fllowingListItemTap(
                  fllowingItems[index].login, fllowingItems[index].htmlUrl),
              // isThreeLine: true,
            ),
          );
        },
      );
    } else {
      childWidget = Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.0),
            child: Center(child: SpinKitFadingCircle(
              itemBuilder: (_, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.black26 : Colors.black38,
                  ),
                );
              },
            )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
            child: Center(
              child: Text('正在加载中，请等待~'),
            ),
          ),
        ],
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Fllowing"),
        ),
        body: childWidget);
  }

  @override
  bool get wantKeepAlive => true;

  _fllowingListItemTap(String title, String htmlUrl) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewPage(htmlUrl, title)));
    // Application.router.navigateTo(context, "/webView?title=$title&&url=$htmlUrl");
  }
}
