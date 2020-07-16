// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InfoList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoList _$InfoListFromJson(Map<String, dynamic> json) {
  return InfoList()
    ..curPage = json['curPage'] as int
    ..datas = json['datas'] as List
    ..offset = json['offset'] as int
    ..over = json['over'] as bool
    ..pageCount = json['pageCount'] as int
    ..size = json['size'] as int
    ..total = json['total'] as int;
}

Map<String, dynamic> _$InfoListToJson(InfoList instance) => <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };
