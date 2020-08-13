import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHDiscoveryItem extends StatelessWidget {
  final String content;

  ATHDiscoveryItem(this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: buildBoxDecoration(),
        /**
         *
         * CachedNetworkImage(
            imageUrl: 'https://gank.io/images/882afc997ad84f8ab2a313f6ce0f3522',
            fit: BoxFit.fill)
         */
        child: Image.asset('assets/images/nz.jpg', fit: BoxFit.fill));
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        boxShadow: [BoxShadow(color: Colors.grey)]);
  }
}
