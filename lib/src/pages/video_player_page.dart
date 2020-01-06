import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/utils/navigate_util.dart';
import 'package:flutter_app_learn/src/utils/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:video_player/video_player.dart';

class ViderPlayerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViderPlayerPageState();
}

class _ViderPlayerPageState extends State<ViderPlayerPage> {
  List<Widget> _videoList = [];

  final String videoUrl = 'https://www.runoob.com/try/demo_source/mov_bbb.mp4';

  VideoPlayerController _videoPlayerController;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    initVideoPlayer();

    // _videoList.add();
  }

  initVideoPlayer() async {
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // print(appDocDir);
    // assets/videos/wanshifu.mp4

    // File videoFile = File("/assets/videos/wanshifu.mp4");
    // print(videoFile.path);

    _videoPlayerController = VideoPlayerController.network(this.videoUrl)
      // 播放状态
      ..addListener(() {
        final bool isPlaying = _videoPlayerController.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      // 在初始化完成后必须更新界面
      ..initialize().then((_) {
        _videoPlayerController.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  _videoPlayOrPause() {
    print('pause ${_videoPlayerController.value.isPlaying}');
    Duration position = _videoPlayerController.value.position;
    print('pause ${position.toString()}');
    if (_isPlaying) {
      // _videoPlayerController.seekTo();
      _videoPlayerController.pause();
    } else {
      _videoPlayerController.seekTo(Duration.zero);
      _videoPlayerController.play();
    }
    // setState(() {
    //   _videoPlayerController =
    //       VideoPlayerController.network(this.videoUrl)
    //         // 播放状态
    //         ..addListener(() {
    //           final bool isPlaying =
    //               _videoPlayerController.value.isPlaying;
    //           if (isPlaying != _isPlaying) {
    //             setState(() {
    //               _isPlaying = isPlaying;
    //             });
    //           }
    //         })
    //         // 在初始化完成后必须更新界面
    //         ..initialize().then((_) {
    //           _videoPlayerController.play();
    //           setState(() {});
    //         });
    // })
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Material(
        child: Container(
      color: Colors.transparent,
      child: _videoPlayerController.value.initialized
          // 加载成功
          ? Stack(
              children: <Widget>[
                Swiper(
                  itemCount: 2,
                  loop: false,
                  scrollDirection: Axis.vertical,
                  itemWidth: ScreenUtil.screenWidth,
                  itemHeight: ScreenUtil.screenHeight,
                  itemBuilder: _videoPlayerBuilder,
                  onTap: (index) => {_videoPlayOrPause()},
                ),
                Positioned(
                  left: ScreenUtil.getInstance().setWidth(40),
                  top: ScreenUtil.getInstance().setHeight(80),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            _videoPlayerController.pause();
                            NavigatorUtil.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    ));
  }

  Future<void> _refreshVideoData() async {
    ToastUtil.showToast(message: "TODO：下拉刷新数据");
  }

  Widget _videoPlayerBuilder(BuildContext context, int index) {
    return Container(
      // width: ScreenUtil.screenWidth,
      // height: ScreenUtil.screenHeight,
      child: AspectRatio(
        // aspectRatio: _videoPlayerController.value.aspectRatio,
        aspectRatio: ScreenUtil.screenHeight / ScreenUtil.screenHeight,
        child: VideoPlayer(_videoPlayerController),
      ),
    );
  }
}
