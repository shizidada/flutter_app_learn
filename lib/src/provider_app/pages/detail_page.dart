import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.id, this.title, this.name}) : super(key: key);

  final int id;
  final String title;
  final String name;

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    // DataItem _dataItem = DataItem.fromJson(widget.item);
    // print(_dataItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Detail"),
      ),
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('name :: ${widget.name}'),
                Text('id :: ${widget.id.toString()}'),
                Text('title :: ${widget.title}'),
              ],
            )),
      ),
    );
  }
}
