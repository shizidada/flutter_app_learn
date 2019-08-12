import 'package:flutter/material.dart';
import 'package:flutter_app_learn/models/StarredItem.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.githubItem}) : super(key: key);

  final StarredItem githubItem;

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StarredItem githubItem = widget?.githubItem;
    print(githubItem?.language);

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Detail"),
      ),
      body: Card(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 40,
                  child: Text("id : " + githubItem?.id.toString()),
                ),
                Container(
                  height: 40,
                  child: Text("nodeId : " + githubItem?.nodeId),
                ),
                Container(
                  height: 40,
                  child: Text("name : " + githubItem?.name),
                ),
                Container(
                  height: 40,
                  child: Text("fullName : " + githubItem?.fullName),
                ),
                Container(
                  height: 40,
                  child: Text(githubItem.language == null
                      ? "language: "
                      : "language: " + githubItem?.language),
                ),
                Container(
                  height: 40,
                  child: Text("private : " + githubItem?.private.toString()),
                ),
                Container(
                  height: 40,
                  child: Text("描述 : " + githubItem?.description),
                ),
              ],
            )),
      ),
    );
  }
}
