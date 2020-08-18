import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/global_container_wrapper.dart';

import 'widgets/collect_list_view.dart';

class ATHCollectBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ATHGlobalContainerWrapper(child: ATHCollectListView());
  }
}
