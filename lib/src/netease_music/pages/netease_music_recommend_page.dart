import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/netease_music/providers/netease_music_provider.dart';
import 'package:flutter_app_learn/src/netease_music/widgets/netease_music_tip_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_learn/src/netease_music/models/new_song_model.dart'
    as Song;
import 'package:flutter_app_learn/src/netease_music/models/recommend_model.dart'
    as Recommend;

class NeteaseMusicRecommendPage extends StatefulWidget {
  NeteaseMusicRecommendPage({Key key}) : super(key: key);

  @override
  _NeteaseMusicRecommendPageState createState() =>
      _NeteaseMusicRecommendPageState();
}

class _NeteaseMusicRecommendPageState extends State<NeteaseMusicRecommendPage>
    with AutomaticKeepAliveClientMixin {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    ScreenUtil sc = ScreenUtil.getInstance();

    NeteaseMusicProvider neteaseMusicProvider =
        Provider.of<NeteaseMusicProvider>(context);

    neteaseMusicProvider.getRecommendSong(null);
    neteaseMusicProvider.getNewSong(null);

    Recommend.RecommendModel recommendModel =
        neteaseMusicProvider.recommendModel;
    Song.NewSongModel newSongModel = neteaseMusicProvider.newSongModel;

    return SingleChildScrollView(
      // padding: EdgeInsets.only(left: sc.setWidth(10.0),top: sc.setWidth(10.0)),
      controller: scrollController,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          NeteaseMusicTipItem(
            tipName: "推荐歌单",
          ),
          recommendModel != null
              ? GridView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  itemCount: recommendModel.result.length,
                  itemBuilder: (BuildContext context, int position) {
                    Recommend.Result result = recommendModel.result[position];
                    return Card(
                      child: Container(
                        child: Stack(
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: result.picUrl,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.music_note,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '${result.playCount}',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              right: sc.setWidth(8.0),
                              top: sc.setHeight(8.0),
                            ),
                            Positioned(
                              child: Text(
                                '${result.name}',
                                style: TextStyle(color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              left: sc.setWidth(8.0),
                              bottom: sc.setHeight(8.0),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                      /// 横轴元素个数
                      crossAxisCount: 2,

                      /// 纵轴间距
                      mainAxisSpacing: sc.setWidth(2.0),

                      /// 横轴间距
                      crossAxisSpacing: sc.setWidth(2.0),

                      /// 子组件宽高长度比例
                      childAspectRatio: 1.0),
                )
              : Container(
                  height: sc.setHeight(380.0),
                ),
          NeteaseMusicTipItem(
            tipName: "最新音乐",
          ),
          newSongModel != null
              ? ListView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  itemBuilder: (BuildContext context, int positon) {
                    Song.Result result = newSongModel.result[positon];
                    return Card(
                      child: Container(
                        margin: EdgeInsets.only(top: sc.setHeight(8.0)),
                        child: ListTile(
                          title: Text(result.name),
                          subtitle: Text(result.alg),
                          leading: CircleAvatar(
                            radius: sc.setWidth(30.0),
                            child: CachedNetworkImage(
                              imageUrl: result.picUrl,
                            ),
                          ),
                          trailing: Icon(Icons.play_circle_filled),
                        ),
                      ),
                    );
                  },
                  itemCount: newSongModel.result.length,
                )
              : Container(
                  height: sc.setHeight(380.0),
                ),
          Container(
            padding: EdgeInsets.all(sc.setWidth(16.0)),
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl:
                      'https://s3.music.126.net/mobile-new/img/recommand_bg_2x.png?d045fafc60e017b653f8065a87496922=',
                  fit: BoxFit.cover,
                ),
                SvgPicture.asset("assets/svg/netease_logo_footer.svg",
                    fit: BoxFit.contain),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
