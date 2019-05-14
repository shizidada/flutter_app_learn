import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConstactFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConstactFragmentState();
}

class _ConstactFragmentState extends State<ConstactFragment> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Constact"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("This is the Constact page"),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
