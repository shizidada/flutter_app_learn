import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_body.dart';

class ATHCategoryScreen extends StatelessWidget {
  static final String routeName = "app://categoryScreen";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return ATHCategoryBody();
  }
}
