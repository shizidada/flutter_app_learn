// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class FavoriteItem extends StatefulWidget {
//   FavoriteItem({Key key, @required this.favoriteInfo}) : super(key: key);

//   final FavoriteInfo favoriteInfo;

//   @override
//   _FavoriteItemState createState() => _FavoriteItemState();
// }

// class _FavoriteItemState extends State<FavoriteItem> {
//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

//     return Container(
//         child: Card(
//       color: Colors.grey[300],
//       child: Stack(
//         children: <Widget>[
//           CachedNetworkImage(
//             height: ScreenUtil.screenHeight,
//             width: ScreenUtil.screenWidth,
//             imageUrl: widget.favoriteInfo.avatar,
//             placeholder: (context, url) => Center(
//               child: CircularProgressIndicator(),
//             ),
//             errorWidget: (context, url, error) => Icon(Icons.error),
//           ),
//           Positioned(
//             bottom: 0.0,
//             left: ScreenUtil.getInstance().setWidth(8.0),
//             width: ScreenUtil.getInstance().setWidth(250.0),
//             child: Text(
//               widget.favoriteInfo.name,
//               // style: TextStyle(),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Positioned(
//             bottom: 0.0,
//             right: ScreenUtil.getInstance().setWidth(8.0),
//             child: CircleAvatar(
//               backgroundColor: Colors.white,
//               radius: ScreenUtil.getInstance().setWidth(38.0),
//               child: CachedNetworkImage(
//                 imageUrl: widget.favoriteInfo.avatar,
//                 placeholder: (context, url) => Center(
//                   child: CircularProgressIndicator(),
//                 ),
//                 errorWidget: (context, url, error) => Icon(Icons.error),
//               ),
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
