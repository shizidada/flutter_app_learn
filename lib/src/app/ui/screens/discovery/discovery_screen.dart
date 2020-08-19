import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/global_container_wrapper.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroll/scroller_configuration_wrapper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'widgets/discovery_item.dart';
import 'widgets/discovery_list_view.dart';

// 发现
class ATHDiscoveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("发现")),
        body: ATHGlobalContainerWrapper(child: ATHDiscoveryListView()));
  }

  Widget buildStaggeredGridView() {
    return ATHScrollerConfigurationWrapper(
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        itemCount: 10,
        mainAxisSpacing: 8.0.w,
        crossAxisSpacing: 8.0.w,
        crossAxisCount: 8.w.toInt(),
        itemBuilder: (context, index) => ATHDiscoveryItem(),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 3 : 2),
      ),
    );
  }
}
