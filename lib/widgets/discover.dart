import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_learn/provider/current_index_provide.dart';
import 'package:provide/provide.dart';

class Discover extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("This is the Discover page"),
          RaisedButton(
            child: Text("dianji"),
            onPressed: () {
              int currentIndex =
                  Provide.value<CurrentIndexProvide>(context).currentIndex;
              Provide.value<CurrentIndexProvide>(context).changeIndex(1);
              print(currentIndex);
            },
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
