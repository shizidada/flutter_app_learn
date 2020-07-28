import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/mocks/image_bean.dart';

class ImageUtil {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static Future<T> pushPage<T extends Object>(
      BuildContext context, Widget page) {
    return Navigator.push(
      context,
      CupertinoPageRoute(builder: (ctx) => page),
    );
  }

  static void showSnackBar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }

  static Widget getWidget(String url) {
    // if (url.startsWith('http')) {
    //   //return CachedNetworkImage(imageUrl: url, fit: BoxFit.cover);
    //   return Image.network(url, fit: BoxFit.cover);
    // }
    // if (url.endsWith('.png')) {
    //   return Image.asset(url,
    //       fit: BoxFit.cover, package: 'flutter_gallery_assets');
    // }
    //return Image.file(File(url), fit: BoxFit.cover);
    return Image.asset(getImgPath(url), fit: BoxFit.cover);
  }

  static Image getBigImage(String url) {
    if (url == null || url.isEmpty) return null;
    if (url.startsWith('http')) {
      //return Image(image: CachedNetworkImageProvider(url), fit: BoxFit.cover);
      return Image.network(url, fit: BoxFit.cover);
    }
    if (url.endsWith('.png')) {
      return Image.asset(url,
          fit: BoxFit.cover, package: 'flutter_gallery_assets');
    }
    //return Image.file(File(url), fit: BoxFit.cover);
    return Image.asset(getImgPath(url), fit: BoxFit.cover);
  }

  static List<ImageBean> getTestData() {
    List<String> urlList = [
      'avatar',
      'avatar',
      'avatar',
      'avatar',
      'avatar',
      'avatar',
    ];
    List<ImageBean> list = List();
    for (int i = 0; i < urlList.length; i++) {
      String url = urlList[i];
      list.add(ImageBean(
        originPath: url,
        middlePath: url,
        thumbPath: url,
        originalWidth: i == 0 ? 264 : null,
        originalHeight: i == 0 ? 258 : null,
      ));
    }
    return list;
  }
}
