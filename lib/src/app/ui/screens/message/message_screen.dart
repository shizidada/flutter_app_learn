import 'package:flutter/material.dart';

class ATHMessageScreen extends StatelessWidget {
  static final String routeName = "app://message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
      ),
      body: Center(
        child: Text("消息中心"),
      ),
    );
  }
}
