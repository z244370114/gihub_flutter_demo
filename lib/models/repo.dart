import 'package:json_annotation/json_annotation.dart';
import 'user.dart';
import 'repo.dart';

part 'repo.g.dart';

@JsonSerializable()
class Repo {
      Repo();

  int id;
  String name;
  @JsonKey(name: 'full_name') String fullName;
  User owner;
  Repo parent;
  bool private;
  String description;
  bool fork;
  String language;
  @JsonKey(name: 'forks_count') int forksCount;
  @JsonKey(name: 'stargazers_count') int stargazersCount;
  int size;
  @JsonKey(name: 'default_branch') String defaultBranch;
  @JsonKey(name: 'open_issues_count') int openIssuesCount;
  @JsonKey(name: 'pushed_at') String pushedAt;
  @JsonKey(name: 'created_at') String createdAt;
  @JsonKey(name: 'updated_at') String updatedAt;
  @JsonKey(name: 'subscribers_count') int subscribersCount;
  License license;

  factory Repo.fromJson(Map<String,dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}

@JsonSerializable()
class License {
      License();

  String key;
  String name;
  @JsonKey(name: 'spdx_id') String spdxId;
  String url;
  @JsonKey(name: 'node_id') String nodeId;

  factory License.fromJson(Map<String,dynamic> json) => _$LicenseFromJson(json);
  Map<String, dynamic> toJson() => _$LicenseToJson(this);
}
