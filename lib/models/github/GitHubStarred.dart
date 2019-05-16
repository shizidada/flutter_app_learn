import 'package:flutter_app_learn/models/github/StarredItem.dart';

class GitHubStarred {
  final List<StarredItem> githubItem;

  GitHubStarred({this.githubItem});

  factory GitHubStarred.formJson(List<dynamic> parsedJson) {
    List<StarredItem> githubItem = new List<StarredItem>();
    // note ！！！⚠️
    githubItem = parsedJson.map((i) => StarredItem.fromJson(i)).toList();
    return GitHubStarred(
      githubItem: githubItem,
    );
  }
}
