import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_learn/models/github/GitHubStarred.dart';
import 'package:flutter_app_learn/models/github/GithubItem.dart';
import 'package:flutter_app_learn/pages/detail_page/detail.dart';
import 'package:flutter_app_learn/service/GithubService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GithubView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GithubViewState();
}

class _GithubViewState extends State<GithubView>
    with AutomaticKeepAliveClientMixin {
  List<GithubItem> datas = [];

/*1、IndexedStack 存储页面
IndexedStack(
  children: <Widget>[
    Page1(),
    Page2(),
    Page3()
  ],
  index: _currentPageIndex,
 */
// 2
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("initState");
    _loadData();
  }

  _loadData() {
    if (datas.length == 0) {
      getStarred().then((res) => setState(() {
            datas = GitHubStarred.formJson(res.data).githubItem;
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget childWidget;
    if (datas != null && datas.length != 0) {
      childWidget = ListView.builder(
        itemCount: datas.length,
        itemBuilder: (contxt, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.code),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text('${datas[index].fullName}'),
              subtitle: Text('${datas[index].name}'),
              onTap: () => _listTileClick(index),
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
    return Scaffold(body: childWidget);
  }

  _listTileClick(int index) {
    GithubItem githubItem = datas[index];
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(githubItem: githubItem)));
    // Application.router.navigateTo(context, "/detail?githubItem=$githubItem");
  }
}
