// To parse this JSON data, do
//
//     final restaurent = restaurentFromJson(jsonString);

import 'dart:convert';

Restaurent restaurentFromJson(String str) => Restaurent.fromJson(json.decode(str));

String restaurentToJson(Restaurent data) => json.encode(data.toJson());

class Restaurent {
  bool status;
  List<RestaurentDatum> data;

  Restaurent({
    required this.status,
    required this.data,
  });

  factory Restaurent.fromJson(Map<String, dynamic> json) => Restaurent(
    status: json["status"],
    data: List<RestaurentDatum>.from(json["data"].map((x) => RestaurentDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class RestaurentDatum {
  int id;
  String pic;
  String coverPhoto;
  String name;
  String deliveryTime;
  String tags1;
  String tags2;
  String verified;
  String lat;
  String long;
  String? menu;
  DateTime createdAt;
  DateTime updatedAt;

  RestaurentDatum({
    required this.id,
    required this.pic,
    required this.coverPhoto,
    required this.name,
    required this.deliveryTime,
    required this.tags1,
    required this.tags2,
    required this.verified,
    required this.lat,
    required this.long,
    required this.createdAt,
    required this.updatedAt,
    required this.menu,
  });

  factory RestaurentDatum.fromJson(Map<String, dynamic> json) => RestaurentDatum(
    id: json["id"],
    pic: json["pic"],
    coverPhoto: json["cover_photo"],
    name: json["name"],
    deliveryTime: json["delivery_time"],
    tags1: json["tags1"],
    tags2: json["tags2"],
    verified: json["verified"],
    lat: json["lat"],
    long: json["long"],
    menu: null,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pic": pic,
    "cover_photo": coverPhoto,
    "name": name,
    "delivery_time": deliveryTime,
    "tags1": tags1,
    "tags2": tags2,
    "verified": verified,
    "lat": lat,
    "long": long,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
