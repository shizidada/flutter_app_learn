import 'package:json_annotation/json_annotation.dart';

import 'user_model.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel extends Object {
  @JsonKey(name: 'messageId')
  String messageId;

  @JsonKey(name: 'isRead')
  int isRead;

  @JsonKey(name: 'sendDate')
  int sendDate;

  @JsonKey(name: 'readDate')
  int readDate;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'to')
  UserModel to;

  @JsonKey(name: 'from')
  UserModel from;

  MessageModel(
    this.messageId,
    this.isRead,
    this.sendDate,
    this.readDate,
    this.msg,
    this.to,
    this.from,
  );

  factory MessageModel.fromJson(Map<String, dynamic> srcJson) =>
      _$MessageModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
