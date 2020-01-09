import 'package:flutter_app_learn/src/models/user_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result<T> {
  Result({this.data, this.code, this.message, this.status});

  @_Converter()
  final List<T> data;
  final int code;
  final bool status;
  final String message;

  //反序列化
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      return UserInfoModel.fromJson(json) as T;
    }
    return json as T;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}
