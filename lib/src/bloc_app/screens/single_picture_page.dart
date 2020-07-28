import 'package:flutter/material.dart';
import 'package:nine_grid_view/nine_grid_view.dart';
import 'package:flutter_app_learn/src/bloc_app/utils/image_util.dart';
import 'package:flutter_app_learn/src/bloc_app/mocks/image_bean.dart';

class SinglePictureScreen extends StatefulWidget {
  @override
  _SinglePictureScreenState createState() => _SinglePictureScreenState();
}

class _SinglePictureScreenState extends State<SinglePictureScreen> {
  List<ImageBean> imageList = List();

  @override
  void initState() {
    super.initState();
    imageList = ImageUtil.getTestData();
  }

  Widget _buildItem(BuildContext context, int _index) {
    int itemCount = 5;

    ImageBean imageBean = imageList[_index];
    String url = imageBean.middlePath;

    int originalWidth;
    int originalHeight;

    Image bigImage;
    String bigImageUrl;

    // Single picture display big picture.
    if (itemCount == 1) {
      // ImageBean imageBean = imageList[0];
      originalWidth = imageBean.originalWidth;
      originalHeight = imageBean.originalHeight;
      bigImage = ImageUtil.getBigImage(imageBean.middlePath);
      bigImageUrl = imageBean.middlePath;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        NineGridView(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(5),
          space: 5,
          bigImageWidth: originalWidth,
          bigImageHeight: originalHeight,
          bigImage: bigImage,
          bigImageUrl: bigImageUrl,
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return ImageUtil.getWidget(url);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Picture'),
        centerTitle: true,
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: imageList.length,
          padding: EdgeInsets.all(0),
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(context, index);
          }),
    );
  }
}
