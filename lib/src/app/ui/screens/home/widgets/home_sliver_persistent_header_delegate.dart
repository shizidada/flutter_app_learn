import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/colors.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/shadow.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHHomeSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        padding: EdgeInsets.all(24.px),
        margin: EdgeInsets.symmetric(vertical: 20.px),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              ATHBoxShadow.shadow,
            ],
            borderRadius: BorderRadius.all(Radius.circular(10.px))),
        child: GridView.builder(
            itemCount: 8,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 30.px,
              crossAxisSpacing: 30.px,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (ctx, index) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.apps,
                      color: ATHColors.color33,
                    ),
                    SizedBox(
                      height: 16.px,
                    ),
                    Text(
                      'current $index',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ATHColors.color33,
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  @override
  double get maxExtent => 500.px;

  @override
  double get minExtent => 200.px;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
