// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsListModel _$FriendsListModelFromJson(Map<String, dynamic> json) {
  return FriendsListModel(
    json['code'] as int,
    json['status'] as bool,
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['message'] as String,
  );
}

Map<String, dynamic> _$FriendsListModelToJson(FriendsListModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['userId'] as String,
    json['username'] as String,
    json['description'] as String,
    json['gender'] as String,
    json['phone'] as String,
    json['avatar'] as String,
    json['email'] as String,
    json['createDate'] as String,
    json['updateDate'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
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
