class GitHubUser {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String htmlUrl;
  String name;
  String bio;
  int followers;
  int following;

  GitHubUser(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.htmlUrl,
      this.name,
      this.bio,
      this.followers,
      this.following});

  factory GitHubUser.fromJson(Map<String, dynamic> parsedJson) {
    return GitHubUser(
      login: parsedJson["login"],
      id: parsedJson["id"],
      nodeId: parsedJson["node_id"],
      avatarUrl: parsedJson["avatar_url"],
      htmlUrl: parsedJson["html_url"],
      name: parsedJson["name"],
      bio: parsedJson["bio"],
      followers: parsedJson["followers"],
      following: parsedJson["following"],
    );
  }
}
