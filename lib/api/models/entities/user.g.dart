// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      deviceId: json['deviceId'] as String,
      username: json['username'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'username': instance.username,
      'password': instance.password,
      'role': instance.role,
      'createdAt': instance.createdAt.toIso8601String(),
    };
