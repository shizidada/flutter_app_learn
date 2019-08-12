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
  int _currentIndex = 0;

  void _incrementHandle() {
    int currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;
    currentIndex++;
    Provide.value<CurrentIndexProvide>(context).changeIndex(currentIndex);

    setState(() {
      _currentIndex = currentIndex;
    });
    print(currentIndex);
  }

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
            child: Text("Counter $_currentIndex"),
            onPressed: () {
              _incrementHandle();
            },
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
