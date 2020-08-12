import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHHomeBasicInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(24.w),
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
              ),
            );
          },
          childCount: 8,
        ),
      ),
    );
  }
}
