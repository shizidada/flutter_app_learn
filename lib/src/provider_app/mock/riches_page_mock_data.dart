class RichesPageMockData {
  static List<String> listData = [
    "Clear Login Info",
    "Video Player",
    "Show Bottom Sheet",
    "Change Badge",
    "Keyboard Actions",
    "Netease Music"
  ];
}

class CommentInfo {
  CommentInfo(
      {this.id, this.avator, this.userId, this.userName, this.commentContent});

  String id;
  String avator;
  String userId;
  String userName;
  String commentContent;
}
