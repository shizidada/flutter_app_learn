// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataItem _$DataItemFromJson(Map<String, dynamic> json) {
  return DataItem(
    by: json['by'] as String,
    descendants: json['descendants'] as int,
    id: json['id'] as int,
    kids: (json['kids'] as List)?.map((e) => e as int)?.toList(),
    score: json['score'] as int,
    time: json['time'] as int,
    title: json['title'] as String,
    type: json['type'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$DataItemToJson(DataItem instance) => <String, dynamic>{
      'by': instance.by,
      'descendants': instance.descendants,
      'id': instance.id,
      'kids': instance.kids,
      'score': instance.score,
      'time': instance.time,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
