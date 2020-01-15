// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopListModel _$TopListModelFromJson(Map<String, dynamic> json) {
  return TopListModel(
    json['code'] as int,
    (json['list'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['artistToplist'] == null
        ? null
        : ArtistToplist.fromJson(json['artistToplist'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TopListModelToJson(TopListModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'list': instance.list,
      'artistToplist': instance.artistToplist,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['subscribers'] as List,
    json['updateFrequency'] as String,
    json['backgroundCoverId'] as int,
    json['titleImage'] as int,
    json['opRecommend'] as bool,
    json['userId'] as int,
    json['trackNumberUpdateTime'] as int,
    json['createTime'] as int,
    json['highQuality'] as bool,
    json['coverImgId'] as int,
    json['updateTime'] as int,
    json['newImported'] as bool,
    json['anonimous'] as bool,
    json['coverImgUrl'] as String,
    json['totalDuration'] as int,
    json['specialType'] as int,
    json['trackCount'] as int,
    json['commentThreadId'] as String,
    json['privacy'] as int,
    json['trackUpdateTime'] as int,
    json['playCount'] as int,
    json['adType'] as int,
    json['subscribedCount'] as int,
    json['cloudTrackCount'] as int,
    json['tags'] as List,
    json['description'] as String,
    json['status'] as int,
    json['ordered'] as bool,
    json['name'] as String,
    json['id'] as int,
    json['coverImgId_str'] as String,
    json['ToplistType'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'subscribers': instance.subscribers,
      'updateFrequency': instance.updateFrequency,
      'backgroundCoverId': instance.backgroundCoverId,
      'titleImage': instance.titleImage,
      'opRecommend': instance.opRecommend,
      'userId': instance.userId,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'createTime': instance.createTime,
      'highQuality': instance.highQuality,
      'coverImgId': instance.coverImgId,
      'updateTime': instance.updateTime,
      'newImported': instance.newImported,
      'anonimous': instance.anonimous,
      'coverImgUrl': instance.coverImgUrl,
      'totalDuration': instance.totalDuration,
      'specialType': instance.specialType,
      'trackCount': instance.trackCount,
      'commentThreadId': instance.commentThreadId,
      'privacy': instance.privacy,
      'trackUpdateTime': instance.trackUpdateTime,
      'playCount': instance.playCount,
      'adType': instance.adType,
      'subscribedCount': instance.subscribedCount,
      'cloudTrackCount': instance.cloudTrackCount,
      'tags': instance.tags,
      'description': instance.description,
      'status': instance.status,
      'ordered': instance.ordered,
      'name': instance.name,
      'id': instance.id,
      'coverImgId_str': instance.coverImgIdStr,
      'ToplistType': instance.toplistType,
    };

ArtistToplist _$ArtistToplistFromJson(Map<String, dynamic> json) {
  return ArtistToplist(
    json['coverUrl'] as String,
    json['name'] as String,
    json['upateFrequency'] as String,
    json['position'] as int,
    json['updateFrequency'] as String,
  );
}

Map<String, dynamic> _$ArtistToplistToJson(ArtistToplist instance) =>
    <String, dynamic>{
      'coverUrl': instance.coverUrl,
      'name': instance.name,
      'upateFrequency': instance.upateFrequency,
      'position': instance.position,
      'updateFrequency': instance.updateFrequency,
    };
