// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wusers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wusers _$WusersFromJson(Map<String, dynamic> json) {
  return Wusers()
    ..data = json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>)
    ..errorCode = json['errorCode'] as int
    ..errorMsg = json['errorMsg'] as String;
}

Map<String, dynamic> _$WusersToJson(Wusers instance) => <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data()
    ..admin = json['admin'] as bool
    ..chapterTops = json['chapterTops'] as List
    ..collectIds = json['collectIds'] as List
    ..email = json['email'] as String
    ..icon = json['icon'] as String
    ..id = json['id'] as int
    ..nickname = json['nickname'] as String
    ..password = json['password'] as String
    ..publicName = json['publicName'] as String
    ..token = json['token'] as String
    ..type = json['type'] as int
    ..username = json['username'] as String;
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'admin': instance.admin,
      'chapterTops': instance.chapterTops,
      'collectIds': instance.collectIds,
      'email': instance.email,
      'icon': instance.icon,
      'id': instance.id,
      'nickname': instance.nickname,
      'password': instance.password,
      'publicName': instance.publicName,
      'token': instance.token,
      'type': instance.type,
      'username': instance.username,
    };
