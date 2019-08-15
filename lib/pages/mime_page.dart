import 'package:flutter/material.dart';

/// 我
class MimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MimePageState();
}

class _MimePageState extends State<MimePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
      child: Text("MimePage"),
    );
  }
}
