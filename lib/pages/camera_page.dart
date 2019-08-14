import 'package:flutter/material.dart';

/// 相机
class CameraPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage>
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
    return Center(
      child: Text("CameraPage"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
