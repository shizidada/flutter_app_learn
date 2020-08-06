// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// /// 列表项
// class ListItem extends StatefulWidget {
//   // 点击事件
//   final VoidCallback onPressed;
//   // 图标
//   final Widget icon;
//   // 标题
//   final String title;
//   final Color titleColor;
//   // 描述
//   final String describe;

//   final Color describeColor;
//   // 右侧控件
//   final Widget rightWidget;

//   // 构造函数
//   ListItem({
//     Key key,
//     this.onPressed,
//     this.icon,
//     this.title,
//     this.titleColor: Colors.black,
//     this.describe,
//     this.describeColor: Colors.grey,
//     this.rightWidget,
//   }) : super(key: key);

//   @override
//   _ListItemState createState() => _ListItemState();
// }

// class _ListItemState extends State<ListItem> {
//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
//     return FlatButton(
//       onPressed: widget.onPressed,
//       padding: EdgeInsets.all(0.0),
//       shape: Border.all(
//         color: Colors.transparent,
//         width: 0.0,
//         style: BorderStyle.none,
//       ),
//       child: Container(
//           height: ScreenUtil.getInstance().setHeight(60.0),
//           width: ScreenUtil.screenWidth,
//           child: Row(
//             children: <Widget>[
//               widget.icon != null
//                   ? Container(
//                       padding: EdgeInsets.all(
//                           ScreenUtil.getInstance().setWidth(14.0)),
//                       child: SizedBox(
//                         height: ScreenUtil.getInstance().setHeight(64.0),
//                         width: ScreenUtil.getInstance().setWidth(64.0),
//                         child: widget.icon,
//                       ),
//                     )
//                   : Container(
//                       width: ScreenUtil.getInstance().setWidth(14.0),
//                     ),
//               Expanded(
//                 flex: 1,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     widget.title != null
//                         ? Text(
//                             widget.title,
//                             style: TextStyle(
//                               color: widget.titleColor,
//                               fontSize: ScreenUtil.getInstance().setSp(32.0),
//                               fontWeight: FontWeight.bold,
//                             ),
//                           )
//                         : Container(),
//                     widget.describe != null
//                         ? Text(
//                             widget.describe,
//                             maxLines: 2,
//                             style: TextStyle(
//                               color: widget.describeColor,
//                               fontSize: ScreenUtil.getInstance().setSp(28.0),
//                             ),
//                           )
//                         : Container(),
//                   ],
//                 ),
//               ),
//               widget.rightWidget == null ? Container() : widget.rightWidget,
//               Container(
//                 width: ScreenUtil.getInstance().setWidth(28.0),
//               ),
//             ],
//           )),
//     );
//   }
// }

// /// 空图标
// class EmptyIcon extends Icon {
//   const EmptyIcon() : super(Icons.hourglass_empty);
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
