import 'package:json_annotation/json_annotation.dart';

part 'friends_list_model.g.dart';

@JsonSerializable()
class FriendsListModel extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'status')
  bool status;

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'message')
  String message;

  FriendsListModel(
    this.code,
    this.status,
    this.data,
    this.message,
  );

  factory FriendsListModel.fromJson(Map<String, dynamic> srcJson) =>
      _$FriendsListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FriendsListModelToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'userId')
  String userId;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'gender')
  String gender;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'createDate')
  String createDate;

  @JsonKey(name: 'updateDate')
  String updateDate;

  Data(
    this.userId,
    this.username,
    this.description,
    this.gender,
    this.phone,
    this.avatar,
    this.email,
    this.createDate,
    this.updateDate,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
