import 'package:json_annotation/json_annotation.dart';


part 'wusers.g.dart';

@JsonSerializable()
class Wusers {
      Wusers();

  Data data;
  int errorCode;
  String errorMsg;

  factory Wusers.fromJson(Map<String,dynamic> json) => _$WusersFromJson(json);
  Map<String, dynamic> toJson() => _$WusersToJson(this);
}

@JsonSerializable()
class Data {
      Data();

  bool admin;
  List<dynamic> chapterTops;
  List<dynamic> collectIds;
  String email;
  String icon;
  int id;
  String nickname;
  String password;
  String publicName;
  String token;
  int type;
  String username;

  factory Data.fromJson(Map<String,dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
