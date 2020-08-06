import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/res/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridViewScreen extends StatelessWidget {
  const StaggeredGridViewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StaggeredGridView.countBuilder(
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Container(
          color: MColors.kPrimaryColor,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('$index'),
            ),
          )),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 3 : 2.5),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    ));
  }
}
