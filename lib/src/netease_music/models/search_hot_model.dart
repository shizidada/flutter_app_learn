import 'package:json_annotation/json_annotation.dart';

part 'search_hot_model.g.dart';

@JsonSerializable()
class SearchHotModel extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'result')
  Result result;

  SearchHotModel(
    this.code,
    this.result,
  );

  factory SearchHotModel.fromJson(Map<String, dynamic> srcJson) =>
      _$SearchHotModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchHotModelToJson(this);
}

@JsonSerializable()
class Result extends Object {
  @JsonKey(name: 'hots')
  List<Hots> hots;

  Result(
    this.hots,
  );

  factory Result.fromJson(Map<String, dynamic> srcJson) =>
      _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Hots extends Object {
  @JsonKey(name: 'first')
  String first;

  @JsonKey(name: 'second')
  int second;

  @JsonKey(name: 'iconType')
  int iconType;

  Hots(
    this.first,
    this.second,
    this.iconType,
  );

  factory Hots.fromJson(Map<String, dynamic> srcJson) =>
      _$HotsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotsToJson(this);
}
