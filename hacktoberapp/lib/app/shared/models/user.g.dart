// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userImage: json['userImage'] as String,
    username: json['username'] as String,
    prs: json['prs'] as List,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'userImage': instance.userImage,
      'prs': instance.prs,
    };
