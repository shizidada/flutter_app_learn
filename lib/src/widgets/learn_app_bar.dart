import 'package:flutter/material.dart';

class LearnAppBar extends StatefulWidget {
  final String title;

  LearnAppBar({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LearnAppBarState();
}

class _LearnAppBarState extends State<LearnAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: MediaQuery.of(context).size.width,
      color: Colors.lightBlue,
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              color: Colors.white),
        ),
      ),
    );
  }
}
