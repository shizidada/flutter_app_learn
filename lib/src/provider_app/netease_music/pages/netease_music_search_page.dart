import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/provider_app/netease_music/models/search_hot_model.dart';
import 'package:flutter_app_learn/src/provider_app/provider/netease_music_provider.dart';
import 'package:flutter_app_learn/src/provider_app/netease_music/widgets/netease_music_tip_item.dart';
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

    SearchHotModel searchHotModel = neteaseMusicProvider.searchHotModel;
    List<Widget> searchHotWidgets = [];
    if (searchHotModel != null) {
      searchHotModel.result.hots.forEach((Hots hots) {
        searchHotWidgets.add(Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade500,
              child: Text(
                '${hots.second}',
                style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
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
                height: ScreenUtil().setHeight(58.0),
                margin: EdgeInsets.all(ScreenUtil().setWidth(16.0)),
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
                      contentPadding: EdgeInsets.only(top: ScreenUtil().setWidth(1.0))),
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(1.0),
              color: Colors.grey[200],
            ),
            NeteaseMusicTipItem(
              tipName: "热门搜索",
            ),
            searchHotModel != null
                ? Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(16.0), top: ScreenUtil().setWidth(16.0)),
                      child: Wrap(
                        spacing: ScreenUtil().setWidth(8.0), // gap between adjacent chips
                        runSpacing: ScreenUtil().setWidth(4.0), // gap between lines
                        children: searchHotWidgets,
                      ),
                    ),
                  )
                : Container(),
            Container(
              child: Text('data'),
            )
          ],
        ),
      ),
    );
  }
}
