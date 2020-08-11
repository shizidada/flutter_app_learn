import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/screens/collect/collect_body.dart';

class ATHCollectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ATHStrings.collectTitle),
      ),
      body: ATHCollectBody(),
    );
  }
}
