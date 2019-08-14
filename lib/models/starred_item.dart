class StarredItem {
  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  String description;
  String language;

  StarredItem(
      {this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.private,
      this.description,
      this.language});

  factory StarredItem.fromJson(Map<String, dynamic> parsedJson) {
    return StarredItem(
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
