// import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/widgets/home_page_content.dart';
// import 'package:flutter_app_learn/config/colors.dart';
// import 'package:flutter_app_learn/provider/current_index_provide.dart';
// import 'package:flutter_app_learn/routers/application.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:provider/provider.dart';

/// 主页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  TabController _controller;
  var _appBarTabs = <Tab>[
    Tab(
      text: "精选",
    ),
    Tab(
      text: "爱看",
    ),
    Tab(
      text: "电视剧",
    ),
    Tab(
      text: "电影",
    ),
    Tab(
      text: "综艺",
    ),
    Tab(
      text: "少儿",
    ),
    Tab(
      text: "动漫",
    ),
    Tab(
      text: "NBA",
    ),
    Tab(
      text: "纪录片",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _appBarTabs.length,
      vsync: this, //动画效果的异步处理，默认格式，背下来即可
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // int currentIndex = Provider.of<CurrentIndexProvide>(context).currentIndex;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: _appBarTabs,
            controller: _controller,
            //配置控制器
            isScrollable: true,
            indicatorColor: Colors.transparent,
            labelStyle: TextStyle(fontSize: 22.0),
            unselectedLabelColor: Color(0xff333333),
            unselectedLabelStyle: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        body: TabBarView(
            controller: _controller, //配置控制器
            children: _appBarTabs
                .map((Tab tab) => Container(
                      child: HomePageContent(title: tab.text),
                    ))
                .toList()),
      ),
    );
  }
}
