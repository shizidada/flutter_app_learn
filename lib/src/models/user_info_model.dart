import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  final String userId;
  final String username;
  final String description;
  final String gender;
  final String phone;
  final String avatar;
  final String email;
  final String job;
  final String address;
  final DateTime createDate;
  final DateTime updateDate;

  UserInfoModel(
      {this.userId,
      this.username,
      this.description,
      this.gender,
      this.phone,
      this.avatar,
      this.email,
      this.job,
      this.address,
      this.createDate,
      this.updateDate});

  //反序列化
  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
