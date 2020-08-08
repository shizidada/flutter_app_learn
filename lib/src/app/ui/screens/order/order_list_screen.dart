import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/screens/order/order_list_content.dart';

class ATHOrderListScreen extends StatelessWidget {
  const ATHOrderListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("订单列表")), body: ATHOrderListContent());
  }
}
