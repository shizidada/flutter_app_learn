import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiscoverFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverFragmentState();
}

class _DiscoverFragmentState extends State<DiscoverFragment> with AutomaticKeepAliveClientMixin {
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
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
