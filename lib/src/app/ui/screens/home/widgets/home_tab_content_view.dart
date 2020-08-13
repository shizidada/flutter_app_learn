import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/global_container_wrapper.dart';

class ATHHomeTabContentView extends StatelessWidget {
  final String title;

  ATHHomeTabContentView({this.title = "Default"});

  @override
  Widget build(BuildContext context) {
    return ATHGlobalContainerWrapper(
      child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: ATHColors.primaryColor,
                  child: Text(title.substring(0, 1)),
                  foregroundColor: Colors.white,
                ),
                title: Text('title'),
                subtitle: Text('subtitle'),
              )),
    );
  }
}
