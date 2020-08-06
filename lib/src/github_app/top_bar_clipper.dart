// // 顶部栏裁剪
// import 'package:flutter/material.dart';

// class TopBarClipper extends CustomClipper<Path> {
//   // 宽高
//   double width;
//   double height;

//   TopBarClipper(this.width, this.height);

//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(0.0, 0.0);
//     path.lineTo(width, 0.0);
//     path.lineTo(width, height / 2);
//     path.lineTo(0.0, height);
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
