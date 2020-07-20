import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Object {
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
  int createDate;

  @JsonKey(name: 'updateDate')
  int updateDate;

  UserModel(
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

  factory UserModel.fromJson(Map<String, dynamic> srcJson) =>
      _$UserModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
