import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/utils/density.dart';

///加载弹窗动画
class LoadingDialog extends StatefulWidget {
  //加载中的文字
  final String loadingText;

  //是否点击控件外部弹窗消失
  final bool outsideDismiss;

  //监听弹窗消失
  final Function dismissListener;

  LoadingDialog(
      {Key key,
      this.loadingText = "loading...",
      this.outsideDismiss = false,
      this.dismissListener})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoadingDialogState();
  }
}

class _LoadingDialogState extends State<LoadingDialog> {
  _dismissDialog() {
    Navigator.of(context).pop();
    widget.dismissListener();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.outsideDismiss ? _dismissDialog : null,
      child: Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: SizedBox(
              width: Density.instance.dp(200),
              height: Density.instance.dp(200),
              child: Container(
                decoration: ShapeDecoration(
                  color: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Density.instance.dp(16)),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: Density.instance.dp(70),
                      height: Density.instance.dp(70),
                      child: CircularProgressIndicator(
                        strokeWidth: Density.instance.dp(5),
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 51, 51, 51)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Density.instance.dp(10),
                      ),
                      child: Text(
                        widget.loadingText,
                        style: TextStyle(
                            fontSize: Density.instance.dp(24),
                            color: Color.fromARGB(255, 51, 51, 51)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
