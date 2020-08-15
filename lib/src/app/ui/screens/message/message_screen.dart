import 'package:flutter/material.dart';

import 'message_body.dart';

class ATHMessageScreen extends StatelessWidget {
  static final String routeName = "app://message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
      ),
      body: ATHMessageBody(),
    );
  }
}
