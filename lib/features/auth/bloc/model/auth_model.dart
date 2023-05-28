// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  User user;
  String token;
  bool status;

  AuthModel({
    required this.user,
    required this.token,
    required this.status,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    user: User.fromJson(json["user"]),
    token: json["token"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
    "status": status,
  };
}

class User {
  int id;
  String name;
  String mobile;
  String email;
  dynamic emailVerifiedAt;
  String otp;
  dynamic avatar;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.mobile,
    required this.email,
    this.emailVerifiedAt,
    required this.otp,
    this.avatar,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    otp: json["otp"],
    avatar: json["avatar"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "otp": otp,
    "avatar": avatar,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
