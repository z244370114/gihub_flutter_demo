import 'package:json_annotation/json_annotation.dart';


part 'InfoList.g.dart';

@JsonSerializable()
class InfoList {
      InfoList();

  int curPage;
  List<dynamic> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  factory InfoList.fromJson(Map<String,dynamic> json) => _$InfoListFromJson(json);
  Map<String, dynamic> toJson() => _$InfoListToJson(this);
}
