import 'package:flutter/material.dart';
import 'package:flutter_app_learn/models/github/GithubItem.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.githubItem}) : super(key: key);

  final GithubItem githubItem;

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
    GithubItem githubItem = widget?.githubItem;
    String description = githubItem.description;

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Detail"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(description)],
        ),
      ),
    );
  }
}
