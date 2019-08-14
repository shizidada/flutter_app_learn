import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/provider/current_index_provide.dart';
import 'package:flutter_app_learn/routers/application.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void _incrementHandle() {
  //   int currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;
  //   currentIndex++;
  //   Provide.value<CurrentIndexProvide>(context).changeIndex(currentIndex);
  //   setState(() {
  //     _currentIndex = currentIndex;
  //   });
  //   print(currentIndex);
  // }

  @override
  Widget build(BuildContext context) {
    int currentIndex = Provider.of<CurrentIndexProvide>(context).currentIndex;
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("detail"),
            onPressed: () {
              // Application.router.navigateTo(context, "/detail",
              //     transition: TransitionType.fadeIn);
              currentIndex++;
              Provider.of<CurrentIndexProvide>(context)
                  .changeIndex(currentIndex);
              // _incrementHandle();
            },
          ),
          Text("$currentIndex")
        ],
      ),
    );
  }
}
