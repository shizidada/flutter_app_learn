import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/netease_music/models/top_list_model.dart';
import 'package:flutter_app_learn/src/provider/netease_music_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NeteaseMusicHotSongPage extends StatefulWidget {
  NeteaseMusicHotSongPage({Key key}) : super(key: key);

  @override
  _NeteaseMusicHotSongPageState createState() =>
      _NeteaseMusicHotSongPageState();
}

class _NeteaseMusicHotSongPageState extends State<NeteaseMusicHotSongPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    ScreenUtil sc = ScreenUtil.getInstance();

    NeteaseMusicProvider neteaseMusicProvider =
        Provider.of<NeteaseMusicProvider>(context);
    neteaseMusicProvider.getTopList(null);
    TopListModel topListModel = neteaseMusicProvider.topListModel;

    return Container(
        child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int position) {
                Data item = topListModel?.list[position];
                return GestureDetector(
                  onTap: () {
                    print('object $position');
                  },
                  child: ListTile(
                    title: Text(
                      item.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: sc.setSp(22.0)),
                    ),
                    leading: CircleAvatar(
                      child: CachedNetworkImage(
                        imageUrl: item.coverImgUrl,
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: Text(
                  'Right Item data $position',
                ),
              );
            },
          )),
        )
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
