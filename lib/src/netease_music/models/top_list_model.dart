import 'package:json_annotation/json_annotation.dart';

part 'top_list_model.g.dart';

@JsonSerializable()
class TopListModel extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'list')
  List<Data> list;

  @JsonKey(name: 'artistToplist')
  ArtistToplist artistToplist;

  TopListModel(
    this.code,
    this.list,
    this.artistToplist,
  );

  factory TopListModel.fromJson(Map<String, dynamic> srcJson) =>
      _$TopListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TopListModelToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'subscribers')
  List<dynamic> subscribers;

  @JsonKey(name: 'updateFrequency')
  String updateFrequency;

  @JsonKey(name: 'backgroundCoverId')
  int backgroundCoverId;

  @JsonKey(name: 'titleImage')
  int titleImage;

  @JsonKey(name: 'opRecommend')
  bool opRecommend;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'trackNumberUpdateTime')
  int trackNumberUpdateTime;

  @JsonKey(name: 'createTime')
  int createTime;

  @JsonKey(name: 'highQuality')
  bool highQuality;

  @JsonKey(name: 'coverImgId')
  int coverImgId;

  @JsonKey(name: 'updateTime')
  int updateTime;

  @JsonKey(name: 'newImported')
  bool newImported;

  @JsonKey(name: 'anonimous')
  bool anonimous;

  @JsonKey(name: 'coverImgUrl')
  String coverImgUrl;

  @JsonKey(name: 'totalDuration')
  int totalDuration;

  @JsonKey(name: 'specialType')
  int specialType;

  @JsonKey(name: 'trackCount')
  int trackCount;

  @JsonKey(name: 'commentThreadId')
  String commentThreadId;

  @JsonKey(name: 'privacy')
  int privacy;

  @JsonKey(name: 'trackUpdateTime')
  int trackUpdateTime;

  @JsonKey(name: 'playCount')
  int playCount;

  @JsonKey(name: 'adType')
  int adType;

  @JsonKey(name: 'subscribedCount')
  int subscribedCount;

  @JsonKey(name: 'cloudTrackCount')
  int cloudTrackCount;

  @JsonKey(name: 'tags')
  List<dynamic> tags;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'ordered')
  bool ordered;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'coverImgId_str')
  String coverImgIdStr;

  @JsonKey(name: 'ToplistType')
  String toplistType;

  Data(
    this.subscribers,
    this.updateFrequency,
    this.backgroundCoverId,
    this.titleImage,
    this.opRecommend,
    this.userId,
    this.trackNumberUpdateTime,
    this.createTime,
    this.highQuality,
    this.coverImgId,
    this.updateTime,
    this.newImported,
    this.anonimous,
    this.coverImgUrl,
    this.totalDuration,
    this.specialType,
    this.trackCount,
    this.commentThreadId,
    this.privacy,
    this.trackUpdateTime,
    this.playCount,
    this.adType,
    this.subscribedCount,
    this.cloudTrackCount,
    this.tags,
    this.description,
    this.status,
    this.ordered,
    this.name,
    this.id,
    this.coverImgIdStr,
    this.toplistType,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ArtistToplist extends Object {
  @JsonKey(name: 'coverUrl')
  String coverUrl;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'upateFrequency')
  String upateFrequency;

  @JsonKey(name: 'position')
  int position;

  @JsonKey(name: 'updateFrequency')
  String updateFrequency;

  ArtistToplist(
    this.coverUrl,
    this.name,
    this.upateFrequency,
    this.position,
    this.updateFrequency,
  );

  factory ArtistToplist.fromJson(Map<String, dynamic> srcJson) =>
      _$ArtistToplistFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArtistToplistToJson(this);
}
