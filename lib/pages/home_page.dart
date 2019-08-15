import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/config/colors.dart';
import 'package:flutter_app_learn/provider/current_index_provide.dart';
import 'package:flutter_app_learn/routers/application.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

/// 主页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  TabController controller;
  var tabs = <Tab>[
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
    controller = TabController(
      length: tabs.length,
      vsync: this, //动画效果的异步处理，默认格式，背下来即可
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    int currentIndex = Provider.of<CurrentIndexProvide>(context).currentIndex;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: tabs,
            controller: controller,
            //配置控制器
            isScrollable: true,
            indicatorColor: Color(0xffffffff),
            indicator: null,
            // indicatorWeight: 1,
            // indicatorSize: TabBarIndicatorSize.tab,
            // indicatorPadding: EdgeInsets.only(bottom: 25.0),
            // labelPadding: EdgeInsets.only(left: 25.0),
            labelColor: Color(0xffffffff),
            labelStyle: TextStyle(
              fontSize: 20.0,
            ),
            // unselectedLabelColor: Color(0xff333333),
            unselectedLabelStyle: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        body: TabBarView(
            controller: controller, //配置控制器
            children: tabs
                .map((Tab tab) => Container(
                      child: Center(
                        child: Text(tab.text),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
