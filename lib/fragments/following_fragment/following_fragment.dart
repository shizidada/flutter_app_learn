
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FllowingFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FllowingFragmentState();
}

class _FllowingFragmentState extends State<FllowingFragment> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fllowing"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("This is the Fllowing page"),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
