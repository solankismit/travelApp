// To parse this JSON data, do
//
//     final getpreferencemodel = getpreferencemodelFromJson(jsonString);

import 'dart:convert';

Getpreferencemodel getpreferencemodelFromJson(String str) => Getpreferencemodel.fromJson(json.decode(str));

String getpreferencemodelToJson(Getpreferencemodel data) => json.encode(data.toJson());

class Getpreferencemodel {
  Getpreferencemodel({
    required this.status,
    required this.detail,
  });

  String status;
  Detail detail;

  factory Getpreferencemodel.fromJson(Map<String, dynamic> json) => Getpreferencemodel(
    status: json["status"],
    detail: Detail.fromJson(json["detail"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "detail": detail.toJson(),
  };
}

class Detail {
  Detail({
    required this.music,
    required this.pet,
    required this.smoke,
    required this.chat,
    required this.ac,
  });

  String music;
  String pet;
  String smoke;
  String chat;
  String ac;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    music: json["music"],
    pet: json["pet"],
    smoke: json["smoke"],
    chat: json["chat"],
    ac: json["AC"],
  );

  Map<String, dynamic> toJson() => {
    "music": music,
    "pet": pet,
    "smoke": smoke,
    "chat": chat,
    "AC": ac,
  };
}
