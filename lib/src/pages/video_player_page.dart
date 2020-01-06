import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class ViderPlayerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViderPlayerPageState();
}

class _ViderPlayerPageState extends State<ViderPlayerPage> {
  final String videoUrl = 'https://www.runoob.com/try/demo_source/mov_bbb.mp4';

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initFilePath();
  }

  initFilePath() async {
    // _videoPlayerController = VideoPlayerController.network(videoUrl);
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // print(appDocDir);
    // assets/videos/wanshifu.mp4

    // File videoFile = File("/assets/videos/wanshifu.mp4");
    // print(videoFile.path);

    _videoPlayerController = VideoPlayerController.network(videoUrl);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoPlay: true,
      // looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
    // this.setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _chewieController == null
        ? Container()
        : Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Container(
                  // height: MediaQuery.of(context).size.height,
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    _chewieController.enterFullScreen();
                  },
                  child: Text('Fullscreen'),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          this.setState(() {
                            _chewieController.dispose();
                            _chewieController = ChewieController(
                              videoPlayerController:
                                  VideoPlayerController.network(videoUrl),
                              aspectRatio:
                                  _videoPlayerController.value.aspectRatio,
                              autoPlay: true,
                              // looping: true,
                            );
                          });
                        },
                        child: Padding(
                          child: Text("Video From NetWork"),
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
