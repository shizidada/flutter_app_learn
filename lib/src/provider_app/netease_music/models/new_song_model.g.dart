// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewSongModel _$NewSongModelFromJson(Map<String, dynamic> json) {
  return NewSongModel(
    json['code'] as int,
    json['category'] as int,
    (json['result'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NewSongModelToJson(NewSongModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'category': instance.category,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    json['id'] as int,
    json['type'] as int,
    json['name'] as String,
    json['picUrl'] as String,
    json['canDislike'] as bool,
    json['alg'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'canDislike': instance.canDislike,
      'alg': instance.alg,
    };
