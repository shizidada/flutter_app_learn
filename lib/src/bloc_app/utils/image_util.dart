import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageUtil {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
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
    if (url.startsWith('http')) {
      //return CachedNetworkImage(imageUrl: url, fit: BoxFit.cover);
      return Image.network(url, fit: BoxFit.cover);
    }
    if (url.endsWith('.png')) {
      return Image.asset(url,
          fit: BoxFit.cover, package: 'flutter_gallery_assets');
    }
    // return Image.file(File(url), fit: BoxFit.cover);
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
}
