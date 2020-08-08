import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'discovery_item.dart';

// 发现
class ATHDiscoveryScreen extends StatelessWidget {
  List<StaggeredTile> _tiles = <StaggeredTile>[
    const StaggeredTile.extent(2, 50.0),
    const StaggeredTile.extent(1, 180.0),
    const StaggeredTile.extent(1, 160.0),
    const StaggeredTile.extent(3, 140.0),
    const StaggeredTile.extent(1, 120.0),
    const StaggeredTile.extent(4, 130.0),
    const StaggeredTile.extent(1, 50.0),
    const StaggeredTile.extent(2, 60.0),
    const StaggeredTile.extent(1, 130.0),
    const StaggeredTile.extent(3, 140.0),
    const StaggeredTile.extent(1, 60.0),
    const StaggeredTile.extent(1, 150.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("发现")),
        body: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          itemCount: 10,
          mainAxisSpacing: 8.0.w,
          crossAxisSpacing: 8.0.w,
          crossAxisCount: 8.w.toInt(),
          itemBuilder: (context, index) => ATHDiscoveryItem(index.toString()),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 3 : 2),
        ));
  }
}
/**
    Container(
    color: Colors.green,
    child: Center(
    child: CircleAvatar(
    backgroundColor: Colors.white,
    child: Text('$index'),
    ),
    ))
 */
