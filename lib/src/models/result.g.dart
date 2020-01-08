// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result<T> _$ResultFromJson<T>(Map<String, dynamic> json) {
  return Result<T>(
    data: (json['data'] as List)?.map(_Converter<T>().fromJson)?.toList(),
    code: json['code'] as int,
    message: json['message'] as String,
    status: json['status'] as bool,
  );
}

Map<String, dynamic> _$ResultToJson<T>(Result<T> instance) => <String, dynamic>{
      'data': instance.data?.map(_Converter<T>().toJson)?.toList(),
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
    };
