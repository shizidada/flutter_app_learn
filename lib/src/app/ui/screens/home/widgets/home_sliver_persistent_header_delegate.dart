import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/shadow.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHHomeSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        padding: EdgeInsets.all(24.w),
        margin: EdgeInsets.symmetric(vertical: 20.w),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              ATHBoxShadow.shadow,
            ],
            borderRadius: BorderRadius.all(Radius.circular(20.w))),
        child: GridView.builder(
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 30.w,
              crossAxisSpacing: 30.w,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (ctx, index) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.apps),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'current $index',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ATHColors.color22,
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  @override
  double get maxExtent => 500.h;

  @override
  double get minExtent => 200.h;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
