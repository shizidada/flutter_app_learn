import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/provider_app/mock/home_page_mock_data.dart';
import 'package:flutter_app_learn/src/provider_app/utils/toast_util.dart';
import 'package:flutter_app_learn/src/provider_app/widgets/search_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_app_learn/provider/current_index_provide.dart';
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

  TextEditingController textEditingController;

  ScrollController scrollController;

  List<AlipayIndexData> alipayIndexData = [];

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();

    scrollController = ScrollController();

    alipayIndexData = HomePageMockData.alipayIndexData;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('HomePage...');
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    ScreenUtil sc = ScreenUtil.getInstance();

    return Scaffold(
      // appBar: AppBar(
      //   // iconTheme: IconThemeData(color: Colors.white),
      //   // backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   title: SearchInput(
      //     controller: textEditingController,
      //     hintText: "五福到，新年到",
      //     icon: Icon(
      //       Icons.search,
      //       color: Colors.grey,
      //     ),
      //   ),
      //   actions: <Widget>[
      //     Icon(Icons.person),
      //     SizedBox(
      //       width: sc.setWidth(10.0),
      //     ),
      //     Icon(Icons.add)
      //   ],
      // ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            title: SearchInput(
              controller: textEditingController,
              hintText: "五福到，新年到",
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            backgroundColor: Colors.redAccent,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/x.png", fit: BoxFit.fill),
            ),
            expandedHeight: sc.setHeight(500.0),
            floating: false,
            pinned: true,
            snap: false,
            actions: <Widget>[
              Icon(Icons.person),
              SizedBox(
                width: sc.setWidth(10.0),
              ),
              Icon(Icons.add)
            ],
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: sc.setWidth(16.0),
                mainAxisSpacing: sc.setHeight(16.0),
                childAspectRatio: 1),
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => GestureDetector(
                      onTap: () {
                        ToastUtil.showToast(message: "Tap $index");
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: alipayIndexData[index].icon,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: sc.setHeight(16.0)),
                              child: Text(
                                alipayIndexData[index].name,
                                style: TextStyle(fontSize: sc.setSp(32.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                childCount: alipayIndexData.length),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text("Item $index"),
                subtitle: Text("Sub Item $index"),
                leading: Icon(Icons.wb_cloudy),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              childCount: 15,
            ),
          )
        ],
      ),
    );
  }
}

// TabController _controller;

// _controller = TabController(
//   length: _appBarTabs.length,
//   vsync: this, // 动画效果的异步处理，默认格式
// );

// List<Tab> _appBarTabs = <Tab>[
//   Tab(
//     text: "精选",
//   ),
//   Tab(
//     text: "电视剧",
//   ),
//   Tab(
//     text: "电影",
//   ),
//   Tab(
//     text: "动漫",
//   ),
//   Tab(
//     text: "NBA",
//   ),
//   Tab(
//     text: "纪录片",
//   ),
// ];

// appBar: AppBar(
//   iconTheme: IconThemeData(color: Colors.white),
//   elevation: 0.0,
//   title: TabBar(
//     tabs: _appBarTabs,
//     controller: _controller,
//     // 配置控制器
//     isScrollable: true,
//     indicatorColor: Colors.transparent,
//     labelStyle: TextStyle(fontSize: ScreenUtil.getInstance().setSp(40.0)),
//     unselectedLabelColor: MColors.de,
//     unselectedLabelStyle: TextStyle(
//       fontSize: ScreenUtil.getInstance().setSp(32.0),
//     ),
//   ),
// ),
// body: SafeArea(
//   child: TabBarView(
//       controller: _controller, //配置控制器
//       children: _appBarTabs
//           .map((Tab tab) => Container(
//                 child: HomePageContent(
//                   title: tab.text,
//                 ),
//               ))
//           .toList()),
// ),

// SafeArea(
//   child: SingleChildScrollView(
// controller: scrollController,
// child: Column(
//   children: <Widget>[
//     Container(
//       height: sc.setHeight(360.0),
//       color: Colors.grey,
//     ),
//     Container(
//       height: sc.setHeight(560.0),
//       padding: EdgeInsets.all(sc.setWidth(10.0)),
//       child: GridView.builder(
//         controller: scrollController,
//         physics: NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4,
//             crossAxisSpacing: sc.setWidth(16.0),
//             mainAxisSpacing: sc.setHeight(16.0),
//             childAspectRatio: 1),
//         itemCount: alipayIndexData.length,
//         itemBuilder: (BuildContext context, int index) => Container(
//           // width: sc.setWidth(80.0),
//           // height: sc.setHeight(80.0),
//           child: GestureDetector(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   child: Icon(
//                     alipayIndexData[index].icon,
//                     color: MColors.alipayColor,
//                     size: sc.setWidth(56.0),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: sc.setHeight(16.0)),
//                   child: Text(
//                     alipayIndexData[index].name,
//                     style: TextStyle(fontSize: sc.setSp(32.0)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//     Container(
//       height: sc.setHeight(360.0),
//       color: Colors.grey,
//     ),
//   ],
// ),
// ))
