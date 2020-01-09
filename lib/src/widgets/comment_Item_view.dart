import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/widgets/input_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentItemView extends StatefulWidget {
  CommentItemView({Key key}) : super(key: key);

  @override
  _CommentItemViewState createState() => _CommentItemViewState();
}

class _CommentItemViewState extends State<CommentItemView> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil.getInstance().setWidth(8.0)),
          height: ScreenUtil.getInstance().setHeight(80.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: Text("11111"),
              ),
              Text("222222")
            ],
          ),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(500),
          child: ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("景区付款哈哈发生了疯狂的按时"),
                subtitle: Text("及缴费卡借款方就看到三家分晋金风科技大"),
                leading: Icon(Icons.supervised_user_circle),
                trailing: Icon(Icons.add_to_photos),
              );
            },
          ),
        ),
        Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: InputItem(
                icon: Icon(Icons.adb),
                controller: controller,
              ),
            ),
            Icon(Icons.add)
          ],
        )
      ],
    );
  }
}
