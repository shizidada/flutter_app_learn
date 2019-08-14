import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/provider/current_index_provide.dart';
import 'package:flutter_app_learn/routers/application.dart';
import 'package:provider/provider.dart';

/// 主页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = Provider.of<CurrentIndexProvide>(context).currentIndex;
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("detail"),
            onPressed: () {
              Application.router.navigateTo(context, "/login",
                  transition: TransitionType.inFromRight);
            },
          ),
          Text("$currentIndex")
        ],
      ),
    );
  }
}
