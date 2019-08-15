import 'package:flutter/material.dart';

/// Vip
class VipPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VipPageState();
}

class _VipPageState extends State<VipPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text("VipPage"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
