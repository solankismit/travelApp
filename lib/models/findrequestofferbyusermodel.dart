// To parse this JSON data, do
//
//     final findrequestofferbyusermodel = findrequestofferbyusermodelFromJson(jsonString);

import 'dart:convert';

Findrequestofferbyusermodel findrequestofferbyusermodelFromJson(String str) => Findrequestofferbyusermodel.fromJson(json.decode(str));

String findrequestofferbyusermodelToJson(Findrequestofferbyusermodel data) => json.encode(data.toJson());

class Findrequestofferbyusermodel {
  Findrequestofferbyusermodel({
    required this.status,
    required this.path,
    required this.detail,
  });

  String status;
  String path;
  List<Detail> detail;

  factory Findrequestofferbyusermodel.fromJson(Map<String, dynamic> json) => Findrequestofferbyusermodel(
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
    required this.id,
    required this.userid,
    required this.leavecity,
    required this.destcity,
    required this.goDate,
    required this.goTime,
    required this.offerStatus,
    required this.bookseats,
    required this.distance,
    required this.offertype,
    required this.vehicleno,
    required this.leaveDestFare,
    required this.drivername,
    required this.chat,
    required this.smoke,
    required this.music,
    required this.ac,
    required this.pet,
    required this.userimage,
  });

  String id;
  String userid;
  String leavecity;
  String destcity;
  DateTime goDate;
  String goTime;
  String offerStatus;
  String bookseats;
  String distance;
  String offertype;
  String vehicleno;
  String leaveDestFare;
  String drivername;
  String chat;
  String smoke;
  String music;
  String ac;
  String pet;
  String userimage;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    userid: json["userid"],
    leavecity: json["leavecity"],
    destcity: json["destcity"],
    goDate: DateTime.parse(json["go_date"]),
    goTime: json["go_time"],
    offerStatus: json["offer_status"],
    bookseats: json["bookseats"],
    distance: json["distance"],
    offertype: json["offertype"],
    vehicleno: json["vehicleno"],
    leaveDestFare: json["leave_dest_fare"],
    drivername: json["drivername"],
    chat: json["chat"],
    smoke: json["smoke"],
    music: json["music"],
    ac: json["AC"],
    pet: json["pet"],
    userimage: json["userimage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "leavecity": leavecity,
    "destcity": destcity,
    "go_date": "${goDate.year.toString().padLeft(4, '0')}-${goDate.month.toString().padLeft(2, '0')}-${goDate.day.toString().padLeft(2, '0')}",
    "go_time": goTime,
    "offer_status": offerStatus,
    "bookseats": bookseats,
    "distance": distance,
    "offertype": offertype,
    "vehicleno": vehicleno,
    "leave_dest_fare": leaveDestFare,
    "drivername": drivername,
    "chat": chat,
    "smoke": smoke,
    "music": music,
    "AC": ac,
    "pet": pet,
    "userimage": userimage,
  };
}
