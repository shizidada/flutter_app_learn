import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/res/colors.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/page_view/home_page_view.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/page_view/mime_page_view.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/page_view/other_page_view.dart';
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
    HomePageView(),
    OtherPageView(content: "Discovery"),
    OtherPageView(content: "Order"),
    OtherPageView(content: "Message"),
    MimePageView(),
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
      appBar: AppBar(
        centerTitle: false,
        title: Text('Home Screen'),
      ),
      body: PageView(
        children: body,
        controller: pageController,
        onPageChanged: onPageViewChange,
        physics: NeverScrollableScrollPhysics(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onTap(2);
        },
        backgroundColor: MColors.kPrimaryColor,
        child: Icon(
          Icons.add,
          color: getColor(2),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: MColors.kPrimaryColor,
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
                      Text("Home", style: TextStyle(color: getColor(0)))
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    onTap(1);
                  },
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(Icons.forum, color: getColor(1)),
                    Text("Discovery", style: TextStyle(color: getColor(1))),
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
                      Text("Order", style: TextStyle(color: getColor(2)))
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
                      Text("Message", style: TextStyle(color: getColor(3)))
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
                      Text("Profile", style: TextStyle(color: getColor(4)))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(int value) {
    return this._currentIndex == value ? Colors.white : Colors.white54;
  }

  void onPageViewChange(value) {
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
