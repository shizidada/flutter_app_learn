// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    json['userId'] as String,
    json['username'] as String,
    json['description'] as String,
    json['gender'] as String,
    json['phone'] as String,
    json['avatar'] as String,
    json['email'] as String,
    json['createDate'] as int,
    json['updateDate'] as int,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'description': instance.description,
      'gender': instance.gender,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'email': instance.email,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
    };
