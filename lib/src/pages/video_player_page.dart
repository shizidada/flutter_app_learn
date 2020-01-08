import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/utils/navigate_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:video_player/video_player.dart';

class ViderPlayerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViderPlayerPageState();
}

class _ViderPlayerPageState extends State<ViderPlayerPage> {
  final String videoUrl = 'https://www.runoob.com/try/demo_source/mov_bbb.mp4';

  VideoPlayerController _videoPlayerController;

  SwiperController _swiperController;

  bool _isPlaying = false;

  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    initVideoPlayer();
  }

  initVideoPlayer() {
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // print(appDocDir);
    // assets/videos/wanshifu.mp4

    // File videoFile = File("/assets/videos/wanshifu.mp4");
    // print(videoFile.path);

    _videoPlayerController = VideoPlayerController.network(this.videoUrl)
      // 播放状态
      ..addListener(_videoPlayerListener)
      // 在初始化完成后必须更新界面
      ..initialize().then((_) {
        // _videoPlayerController.play();
        setState(() {});
      });

    _swiperController = SwiperController();
  }

  _videoPlayerListener() {
    final bool isPlaying = _videoPlayerController.value.isPlaying;
    if (isPlaying) {
      _videoPlayerController.position.then((value) {
        if (value.compareTo(_videoPlayerController.value.duration) == 1) {
          _videoPlayerController.removeListener(_videoPlayerListener);
          this.setState(() {
            _isCompleted = true;
          });
        } else {
          print('playing ... ');
        }
      });
    }

    setState(() {
      _isPlaying = isPlaying;
    });
  }

  @override
  void dispose() {
    _videoPlayerController.removeListener(_videoPlayerListener);
    _videoPlayerController.dispose();
    super.dispose();
  }

  _videoPlayOrPause() {
    Duration position = _videoPlayerController.value.position;
    print('pause ${position.toString()}');
    print('pause ${_videoPlayerController.value.isPlaying}');
    if (_isPlaying) {
      _videoPlayerController.pause();
      _videoPlayerController.removeListener(_videoPlayerListener);
    } else {
      _videoPlayerController.play();
      _videoPlayerController.addListener(_videoPlayerListener);
    }

    if (_isCompleted) {
      _videoPlayerController.addListener(_videoPlayerListener);
      _videoPlayerController.seekTo(Duration.zero);
      _videoPlayerController.play();
      this.setState(() {
        _isCompleted = false;
      });
    }
  }

  _videoTapDown(TapDownDetails tapDownDetails) {
    print("tapDownDetails $tapDownDetails");
  }

  _videoTapUp(TapUpDetails tapUpDetails) {
    print("tapUpDetails $tapUpDetails");
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Material(
      child: _videoPlayerController.value.initialized
          // 加载成功
          ? Stack(
              children: <Widget>[
                GestureDetector(
                  onTapDown: _videoTapDown,
                  onTapUp: _videoTapUp,
                  child: Swiper(
                    itemCount: 2,
                    loop: false,
                    scrollDirection: Axis.vertical,
                    itemWidth: ScreenUtil.screenWidth,
                    itemHeight: ScreenUtil.screenHeight,
                    itemBuilder: _videoPlayerBuilder,
                    onTap: (index) => {_videoPlayOrPause()},
                    onIndexChanged: (index) => {print("index $index")},
                    controller: _swiperController,
                  ),
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
    );
  }

  // Future<Null> _refreshVideoData() async {
  //   return Future.delayed(Duration(seconds: 2), () {
  //     ToastUtil.showToast(message: "TODO：下拉刷新数据");
  //   });
  // }

  Widget _videoPlayerBuilder(BuildContext context, int index) {
    return Container(
      // width: ScreenUtil.screenWidth,
      // height: ScreenUtil.screenHeight,
      child: AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        // aspectRatio: ScreenUtil.screenHeight / ScreenUtil.screenHeight,
        child: VideoPlayer(_videoPlayerController),
      ),
    );
  }
}
