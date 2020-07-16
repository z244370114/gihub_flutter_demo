// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return Repo()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..fullName = json['full_name'] as String
    ..owner = json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>)
    ..parent = json['parent'] == null
        ? null
        : Repo.fromJson(json['parent'] as Map<String, dynamic>)
    ..private = json['private'] as bool
    ..description = json['description'] as String
    ..fork = json['fork'] as bool
    ..language = json['language'] as String
    ..forksCount = json['forks_count'] as int
    ..stargazersCount = json['stargazers_count'] as int
    ..size = json['size'] as int
    ..defaultBranch = json['default_branch'] as String
    ..openIssuesCount = json['open_issues_count'] as int
    ..pushedAt = json['pushed_at'] as String
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String
    ..subscribersCount = json['subscribers_count'] as int
    ..license = json['license'] == null
        ? null
        : License.fromJson(json['license'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'owner': instance.owner,
      'parent': instance.parent,
      'private': instance.private,
      'description': instance.description,
      'fork': instance.fork,
      'language': instance.language,
      'forks_count': instance.forksCount,
      'stargazers_count': instance.stargazersCount,
      'size': instance.size,
      'default_branch': instance.defaultBranch,
      'open_issues_count': instance.openIssuesCount,
      'pushed_at': instance.pushedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'subscribers_count': instance.subscribersCount,
      'license': instance.license,
    };

License _$LicenseFromJson(Map<String, dynamic> json) {
  return License()
    ..key = json['key'] as String
    ..name = json['name'] as String
    ..spdxId = json['spdx_id'] as String
    ..url = json['url'] as String
    ..nodeId = json['node_id'] as String;
}

Map<String, dynamic> _$LicenseToJson(License instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'spdx_id': instance.spdxId,
      'url': instance.url,
      'node_id': instance.nodeId,
    };
