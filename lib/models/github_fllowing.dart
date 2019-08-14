import 'package:flutter_app_learn/models/floowing_item.dart';

class GithubFllowing {
  final List<FloowingItem> fllowingItems;

  GithubFllowing({this.fllowingItems});

  factory GithubFllowing.formJson(List<dynamic> parsedJson) {
    List<FloowingItem> fllowingItems = new List<FloowingItem>();
    // note ！！！⚠️
    fllowingItems = parsedJson.map((i) => FloowingItem.fromJson(i)).toList();
    return GithubFllowing(
      fllowingItems: fllowingItems,
    );
  }
}
