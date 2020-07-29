import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/res/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastScreen extends StatefulWidget {
  FlutterToastScreen({Key key}) : super(key: key);

  @override
  _FlutterToastScreenState createState() => _FlutterToastScreenState();
}

class _FlutterToastScreenState extends State<FlutterToastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(children: [
        RaisedButton(
          child: Text('show toast'),
          onPressed: () {
            Fluttertoast.showToast(
                msg: "This is Center Short Toast",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: MColors.kPrimaryColor,
                textColor: Colors.white,
                fontSize: 16.0);
          },
        )
      ]),
    ));
  }
}
