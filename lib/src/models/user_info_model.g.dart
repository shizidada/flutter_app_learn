// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  return UserInfoModel(
    userId: json['userId'] as String,
    username: json['username'] as String,
    description: json['description'] as String,
    gender: json['gender'] as String,
    phone: json['phone'] as String,
    avatar: json['avatar'] as String,
    email: json['email'] as String,
    job: json['job'] as String,
    address: json['address'] as String,
    createDate: json['createDate'] == null
        ? null
        : DateTime.parse(json['createDate'] as String),
    updateDate: json['updateDate'] == null
        ? null
        : DateTime.parse(json['updateDate'] as String),
  );
}

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'description': instance.description,
      'gender': instance.gender,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'email': instance.email,
      'job': instance.job,
      'address': instance.address,
      'createDate': instance.createDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
    };
