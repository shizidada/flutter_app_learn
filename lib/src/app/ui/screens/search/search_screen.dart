import 'package:flutter/material.dart';

import 'search_app_bar.dart';
import 'search_contetn.dart';

class ATHSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ATHSearchAppBar(),
      body: ATHSearchContent(),
    );
  }
}
