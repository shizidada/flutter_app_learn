class GithubItem {
  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  String description;
  String language;

  GithubItem(
      {this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.private,
      this.description,
      this.language});

  factory GithubItem.fromJson(Map<String, dynamic> parsedJson) {
    return GithubItem(
      id: parsedJson["id"],
      nodeId: parsedJson["node_id"],
      name: parsedJson["name"],
      fullName: parsedJson["full_name"],
      private: parsedJson["private"],
      description: parsedJson["description"],
      language: parsedJson["language"],
    );
  }
}
