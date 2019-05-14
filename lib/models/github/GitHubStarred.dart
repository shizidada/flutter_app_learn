import 'package:flutter_app_learn/models/github/GithubItem.dart';

class GitHubStarred {
  final List<GithubItem> githubItem;

  GitHubStarred({this.githubItem});

  factory GitHubStarred.formJson(List<dynamic> parsedJson) {
    List<GithubItem> githubItem = new List<GithubItem>();
    // note ！！！⚠️
    githubItem = parsedJson.map((i) => GithubItem.fromJson(i)).toList();
    return GitHubStarred(
      githubItem: githubItem,
    );
  }
}
