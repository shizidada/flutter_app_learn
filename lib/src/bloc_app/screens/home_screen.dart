import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/res/colors.dart';
import 'package:flutter_app_learn/src/bloc_app/res/values/strings.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/pages/home_page.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/pages/mime_page.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/pages/other_page.dart';
import 'package:flutter_app_learn/src/bloc_app/utils/density.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;

  PageController pageController = new PageController(initialPage: 0);

  List<Widget> body = <Widget>[
    HomePage(),
    OtherPage(content: "Discovery"),
    OtherPage(content: "Order"),
    OtherPage(content: "Message"),
    MimePage(),
  ];

  @override
  Widget build(BuildContext context) {
    /**
      BlocBuilder<HomeBloc, int>(builder: (_, counter) {
        return Text('Home Bloc of Data $counter');
      }),
      BlocBuilder<DetailBloc, int>(builder: (_, counter) {
        return Text('Detail Bloc of Data $counter');
      }),
     */
    /// todo:
    Density.instance.init(context, 750, 750);
    return Scaffold(
      body: PageView(
        children: body,
        controller: pageController,
        onPageChanged: onPageChange,
        physics: NeverScrollableScrollPhysics(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onTap(2);
        },
        backgroundColor: MColors.kPrimaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // color: MColors.kPrimaryColor,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    onTap(0);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.home, color: getColor(0)),
                      Text(MStrings.kIndexText,
                          style: TextStyle(color: getColor(0)))
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    onTap(1);
                  },
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(Icons.forum, color: getColor(1)),
                    Text(MStrings.kDiscoveryText,
                        style: TextStyle(color: getColor(1))),
                  ])),
              GestureDetector(
                  onTap: () {
                    onTap(2);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        color: getColor(2),
                      ),
                      Text(MStrings.kOrderText,
                          style: TextStyle(color: getColor(2)))
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    onTap(3);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.mail, color: getColor(3)),
                      Text(MStrings.kMessageText,
                          style: TextStyle(color: getColor(3)))
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    onTap(4);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.person, color: getColor(4)),
                      Text(MStrings.kMimeText,
                          style: TextStyle(color: getColor(4)))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(int value) {
    return this._currentIndex == value
        ? MColors.kPrimaryColor
        : MColors.k99Color;
  }

  void onPageChange(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  void onTap(dynamic i) {
    if (i == _currentIndex) return;
    print('current $i');
    setState(() {
      _currentIndex = i;
      pageController.jumpToPage(i);
    });
  }

  @override
  bool get wantKeepAlive => true;
}
