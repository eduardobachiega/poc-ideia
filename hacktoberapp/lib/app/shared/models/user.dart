import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String username;
  String userImage;
  List<dynamic> prs;

  User({
    this.userImage,
    this.username,
    this.prs
  });


  @override
  String toString() {
    return 'User{username: $username, userImage: $userImage, prs: $prs}';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
