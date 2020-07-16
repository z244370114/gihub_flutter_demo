import 'package:json_annotation/json_annotation.dart';


part 'user.g.dart';

@JsonSerializable()
class User {
      User();

  String login;
  @JsonKey(name: 'avatar_url') String avatarUrl;
  String type;
  String name;
  String company;
  String blog;
  String location;
  String email;
  bool hireable;
  String bio;
  @JsonKey(name: 'public_repos') int publicRepos;
  int followers;
  int following;
  @JsonKey(name: 'created_at') String createdAt;
  @JsonKey(name: 'updated_at') String updatedAt;
  @JsonKey(name: 'total_private_repos') int totalPrivateRepos;
  @JsonKey(name: 'owned_private_repos') int ownedPrivateRepos;

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
