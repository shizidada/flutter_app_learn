import 'package:flutter/material.dart';

import 'package:flutter_app_learn/src/bloc_app/components/comment_bottom_sheet.dart';

/// 单独修改了 bottomSheet 组件的高度
import 'package:flutter_app_learn/src/bloc_app/components/custom_bottom_sheet.dart'
    as CustomBottomSheet;

class CustomBottomSheetScreen extends StatelessWidget {
  const CustomBottomSheetScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bottom Sheet'),
        ),
        body: Container(
          child: RaisedButton(
              child: Text('Bottom Sheet'),
              onPressed: () {
                CustomBottomSheet.showModalBottomSheet(
                  backgroundColor: Colors.white.withOpacity(0),
                  context: context,
                  builder: (BuildContext context) => Container(
                    child: CommentBottomSheet(),
                  ),
                );
              }),
        ));
  }
}
