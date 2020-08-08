import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHDiscoveryItem extends StatelessWidget {
  final String content;

  ATHDiscoveryItem(this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: buildBoxDecoration(),
        child: CachedNetworkImage(
            imageUrl: 'https://gank.io/images/882afc997ad84f8ab2a313f6ce0f3522',
            fit: BoxFit.fill));
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.w),
          topRight: Radius.circular(8.w),
          bottomLeft: Radius.circular(8.w),
          bottomRight: Radius.circular(8.w),
        ),
        boxShadow: [BoxShadow(color: Colors.grey)]);
  }
}
