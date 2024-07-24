import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String deviceId;
  final String? username;
  final String? password;
  final String role;
  final DateTime createdAt;

  User({
    required this.id,
    required this.deviceId,
    required this.username,
    required this.password,
    required this.role,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
