import 'package:flutter/material.dart';

class OtherPageView extends StatelessWidget {
  final String content;

  const OtherPageView({@required this.content, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("$content Page"));
  }
}
