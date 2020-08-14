import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHHomeBasicInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 30.w,
          crossAxisSpacing: 30.w,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            //创建子widget
            return PhysicalModel(
              borderRadius: BorderRadius.circular(16.w),
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              elevation: 2,
              child: Container(
                alignment: Alignment.center,
//                color: ATHColors.color8c,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.apps,
                      color: ATHColors.color33,
                    ),
                    SizedBox(
                      height: 16.h,
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
              ),
            );
          },
          childCount: 8,
        ),
      ),
    );
  }
}
