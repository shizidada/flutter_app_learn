import 'package:flutter/material.dart';

class ATHDiscoveryDetailScreen extends StatelessWidget {
  static final String routeName = "app://discoveryDetail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discovery Detail"),
      ),
      body: Center(
        child: Text("Discovery Detail"),
      ),
    );
  }
}
