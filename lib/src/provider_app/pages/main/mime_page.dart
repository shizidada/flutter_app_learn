import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/provider_app/mock/home_page_mock_data.dart';
import 'package:flutter_app_learn/src/provider_app/mock/mime_page_mock_data.dart';
import 'package:flutter_app_learn/src/provider_app/res/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 我
class MimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MimePageState();
}

class _MimePageState extends State<MimePage>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(scrollControllerListaner);
  }

  scrollControllerListaner() {
    // print(scrollController.offset);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<AlipayIndexData> listData1 = MimePageMockData.listData1;
    List<AlipayIndexData> listData2 = MimePageMockData.listData2;
    List<AlipayIndexData> listData3 = MimePageMockData.listData3;
    print(" ------ MimePage ------ ");
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            title: Text(MStrings.mimeTitle),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              height: ScreenUtil().setHeight(300.0),
              color: MColors.alipayColor,
              child: Column(
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(100.0),
                    height: ScreenUtil().setHeight(100.0),
                    color: Colors.black,
                  )
                ],
              ),
            )
                // Image.asset("assets/images/nz.jpg", fit: BoxFit.fill),
                ),
            expandedHeight: ScreenUtil().setHeight(300.0),
            floating: false,
            pinned: true,
            snap: false,
            actions: <Widget>[
              Container(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(24.0),
                      right: ScreenUtil().setHeight(16.0)),
                  child: Text(
                    '设置',
                    style: TextStyle(fontSize: ScreenUtil().setSp(30.0)),
                  ))
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text(
                    listData1[index].name,
                    style: TextStyle(fontSize: ScreenUtil().setSp(32.0)),
                  ),
                  // subtitle: Text("Sub Item $index"),
                  leading: listData1[index].icon,
                  trailing: Icon(Icons.keyboard_arrow_right),
                );
              },
              childCount: listData1.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: ScreenUtil().setHeight(20.0),
              color: Colors.grey[300],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text(
                    listData2[index].name,
                    style: TextStyle(fontSize: ScreenUtil().setSp(32.0)),
                  ),
                  // subtitle: Text("Sub Item $index"),
                  leading: listData2[index].icon,
                  trailing: Icon(Icons.keyboard_arrow_right),
                );
              },
              childCount: listData2.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: ScreenUtil().setHeight(20.0),
              color: Colors.grey[300],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text(
                    listData3[index].name,
                    style: TextStyle(fontSize: ScreenUtil().setSp(32.0)),
                  ),
                  // subtitle: Text("Sub Item $index"),
                  leading: listData3[index].icon,
                  trailing: Icon(Icons.keyboard_arrow_right),
                );
              },
              childCount: listData3.length,
            ),
          )
        ],
      ),
    );
  }
}
