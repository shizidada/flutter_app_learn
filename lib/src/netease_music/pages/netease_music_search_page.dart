import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/netease_music/models/search_hot_model.dart';
import 'package:flutter_app_learn/src/netease_music/providers/netease_music_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NeteaseMusicSearchPage extends StatefulWidget {
  NeteaseMusicSearchPage({Key key}) : super(key: key);

  @override
  _NeteaseMusicSearchPageState createState() => _NeteaseMusicSearchPageState();
}

class _NeteaseMusicSearchPageState extends State<NeteaseMusicSearchPage> {
  @override
  Widget build(BuildContext context) {
    NeteaseMusicProvider neteaseMusicProvider =
        Provider.of<NeteaseMusicProvider>(context);
    neteaseMusicProvider.getSearchHot({"key": "1"});

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    ScreenUtil sc = ScreenUtil.getInstance();

    SearchHotModel searchHotModel = neteaseMusicProvider.searchHotModel;
    List<Widget> searchHotWidgets = [];
    if (searchHotModel != null) {
      searchHotModel.result.hots.forEach((Hots hots) {
        searchHotWidgets.add(Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade500,
              child: Text(
                hots.first,
                style: TextStyle(fontSize: 10.0),
              )),
          label: Text(hots.first),
        ));
      });
    }
    return SafeArea(
      child: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Container(
                height: sc.setHeight(56.0),
                margin: EdgeInsets.all(sc.setWidth(16.0)),
                decoration: BoxDecoration(
                    color: Color(0xffebecec),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: TextField(
                  // autofocus: true,
                  cursorColor: Colors.black,
                  cursorWidth: 1.0,
                  decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: "搜索歌曲、歌手、专辑",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      focusColor: Colors.grey,
                      // focusedBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.grey)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: sc.setHeight(6.0))),
                ),
              ),
            ),
            Container(
              height: sc.setHeight(1.0),
              color: Colors.grey[200],
            ),
            Container(
              child: Text("热门搜索"),
              padding: EdgeInsets.only(
                  left: sc.setWidth(16.0), top: sc.setWidth(16.0)),
            ),
            searchHotModel != null
                ? Flexible(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: sc.setWidth(16.0), top: sc.setWidth(16.0)),
                      child: Wrap(
                        spacing: sc.setWidth(8.0), // gap between adjacent chips
                        runSpacing: sc.setWidth(4.0), // gap between lines
                        children: searchHotWidgets,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
