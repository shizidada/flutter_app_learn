// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return MessageModel(
    json['messageId'] as String,
    json['isRead'] as int,
    json['sendDate'] as int,
    json['readDate'] as int,
    json['msg'] as String,
    json['to'] == null
        ? null
        : UserModel.fromJson(json['to'] as Map<String, dynamic>),
    json['from'] == null
        ? null
        : UserModel.fromJson(json['from'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'isRead': instance.isRead,
      'sendDate': instance.sendDate,
      'readDate': instance.readDate,
      'msg': instance.msg,
      'to': instance.to,
      'from': instance.from,
    };
