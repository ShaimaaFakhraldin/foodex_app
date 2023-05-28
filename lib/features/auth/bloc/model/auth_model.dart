// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  String token;

  AuthModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    image: json["image"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "image": image,
    "token": token,
  };
}



// // To parse this JSON data, do
// //
// //     final authModel = authModelFromJson(jsonString);
//
// import 'dart:convert';
//
// AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));
//
// String authModelToJson(AuthModel data) => json.encode(data.toJson());
//
// class AuthModel {
//   User user;
//   String token;
//   bool status;
//
//   AuthModel({
//     required this.user,
//     required this.token,
//     required this.status,
//   });
//
//   factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
//     user: User.fromJson(json["user"]),
//     token: json["token"],
//     status: json["status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "user": user.toJson(),
//     "token": token,
//     "status": status,
//   };
// }
//
// class User {
//   int id;
//   String name;
//   String mobile;
//   String email;
//   dynamic emailVerifiedAt;
//   String otp;
//   dynamic avatar;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   User({
//     required this.id,
//     required this.name,
//     required this.mobile,
//     required this.email,
//     this.emailVerifiedAt,
//     required this.otp,
//     this.avatar,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"],
//     name: json["name"],
//     mobile: json["mobile"],
//     email: json["email"],
//     emailVerifiedAt: json["email_verified_at"],
//     otp: json["otp"],
//     avatar: json["avatar"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "mobile": mobile,
//     "email": email,
//     "email_verified_at": emailVerifiedAt,
//     "otp": otp,
//     "avatar": avatar,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
