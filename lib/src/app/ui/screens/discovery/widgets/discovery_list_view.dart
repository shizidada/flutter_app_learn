import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroll/scroller_configuration_wrapper.dart';

import 'discovery_item.dart';

class ATHDiscoveryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ATHScrollerConfigurationWrapper(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (ctx, index) {
            return ATHDiscoveryItem();
          }),
    );
  }
}
