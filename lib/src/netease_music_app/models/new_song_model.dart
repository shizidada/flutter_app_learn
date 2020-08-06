import 'package:json_annotation/json_annotation.dart';

part 'new_song_model.g.dart';

@JsonSerializable()
class NewSongModel extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'category')
  int category;

  @JsonKey(name: 'result')
  List<Result> result;

  NewSongModel(
    this.code,
    this.category,
    this.result,
  );

  factory NewSongModel.fromJson(Map<String, dynamic> srcJson) =>
      _$NewSongModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewSongModelToJson(this);
}

@JsonSerializable()
class Result extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'canDislike')
  bool canDislike;

  @JsonKey(name: 'alg')
  String alg;

  Result(
    this.id,
    this.type,
    this.name,
    this.picUrl,
    this.canDislike,
    this.alg,
  );

  factory Result.fromJson(Map<String, dynamic> srcJson) =>
      _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
