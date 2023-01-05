// To parse this JSON data, do
//
//     final findridemodel = findridemodelFromJson(jsonString);

import 'dart:convert';

Findridemodel findridemodelFromJson(String str) => Findridemodel.fromJson(json.decode(str));

String findridemodelToJson(Findridemodel data) => json.encode(data.toJson());

class Findridemodel {
  Findridemodel({
    required this.status,
    required this.path,
    required this.detail,
  });

  String status;
  String path;
  List<Detail> detail;

  factory Findridemodel.fromJson(Map<String, dynamic> json) => Findridemodel(
    status: json["status"],
    path: json["path"],
    detail: List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "path": path,
    "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    required this.offerid,
    required this.offertype,
    required this.userid,
    required this.leaveDestFare,
    required this.leavecity,
    required this.destcity,
    required this.goDate,
    required this.goTime,
    required this.offerpriceType,
    required this.id,
    required this.drivername,
    required this.ac,
    required this.chat,
    required this.smoke,
    required this.music,
    required this.pet,
    required this.userimage,
  });

  String offerid;
  String offertype;
  String userid;
  String leaveDestFare;
  String leavecity;
  String destcity;
  DateTime goDate;
  String goTime;
  String offerpriceType;
  String id;
  String drivername;
  String ac;
  String chat;
  String smoke;
  String music;
  String pet;
  String userimage;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    offerid: json["offerid"],
    offertype: json["offertype"],
    userid: json["userid"],
    leaveDestFare: json["leave_dest_fare"],
    leavecity: json["leavecity"],
    destcity: json["destcity"],
    goDate: DateTime.parse(json["go_date"]),
    goTime: json["go_time"],
    offerpriceType: json["offerprice_type"],
    id: json["id"],
    drivername: json["drivername"],
    ac: json["AC"],
    chat: json["chat"],
    smoke: json["smoke"],
    music: json["music"],
    pet: json["pet"],
    userimage: json["userimage"],
  );

  Map<String, dynamic> toJson() => {
    "offerid": offerid,
    "offertype": offertype,
    "userid": userid,
    "leave_dest_fare": leaveDestFare,
    "leavecity": leavecity,
    "destcity": destcity,
    "go_date": "${goDate.year.toString().padLeft(4, '0')}-${goDate.month.toString().padLeft(2, '0')}-${goDate.day.toString().padLeft(2, '0')}",
    "go_time": goTime,
    "offerprice_type": offerpriceType,
    "id": id,
    "drivername": drivername,
    "AC": ac,
    "chat": chat,
    "smoke": smoke,
    "music": music,
    "pet": pet,
    "userimage": userimage,
  };
}
