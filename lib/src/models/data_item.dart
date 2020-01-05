import 'package:json_annotation/json_annotation.dart';

part 'data_item.g.dart';

@JsonSerializable()
class DataItem {
  final String by;
  final int descendants;
  final int id;
  final List<int> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  @JsonKey(nullable: false)
  final String url;

  DataItem(
      {this.by,
      this.descendants,
      this.id,
      this.kids,
      this.score,
      this.time,
      this.title,
      this.type,
      this.url});

  //反序列化
  factory DataItem.fromJson(Map<String, dynamic> json) =>
      _$DataItemFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$DataItemToJson(this);
}
