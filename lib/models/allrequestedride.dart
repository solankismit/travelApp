// To parse this JSON data, do
//
//     final allrequestedride = allrequestedrideFromJson(jsonString);

import 'dart:convert';

Allrequestedride allrequestedrideFromJson(String str) => Allrequestedride.fromJson(json.decode(str));

String allrequestedrideToJson(Allrequestedride data) => json.encode(data.toJson());

class Allrequestedride {
  Allrequestedride({
    required this.status,
    required this.path,
    required this.detail,
  });

  String status;
  String path;
  List<Detail> detail;

  factory Allrequestedride.fromJson(Map<String, dynamic> json) => Allrequestedride(
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
    required this.offerrequestId,
    required this.userid,
    required this.leaveLong,
    required this.leaveLat,
    required this.destLong,
    required this.destLat,
    required this.godate,
    required this.distance,
    required this.leavecity,
    required this.destination,
    required this.destaddress,
    required this.leaveaddress,
    required this.seats,
  });

  String offerrequestId;
  String userid;
  String leaveLong;
  String leaveLat;
  String destLong;
  String destLat;
  DateTime godate;
  String distance;
  String leavecity;
  String destination;
  String destaddress;
  String leaveaddress;
  String seats;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    offerrequestId: json["offerrequest_id"],
    userid: json["userid"],
    leaveLong: json["leave_long"],
    leaveLat: json["leave_lat"],
    destLong: json["dest_long"],
    destLat: json["dest_lat"],
    godate: DateTime.parse(json["godate"]),
    distance: json["distance"],
    leavecity: json["leavecity"],
    destination: json["destination"],
    destaddress: json["destaddress"],
    leaveaddress: json["leaveaddress"],
    seats: json["seats"],
  );

  Map<String, dynamic> toJson() => {
    "offerrequest_id": offerrequestId,
    "userid": userid,
    "leave_long": leaveLong,
    "leave_lat": leaveLat,
    "dest_long": destLong,
    "dest_lat": destLat,
    "godate": "${godate.year.toString().padLeft(4, '0')}-${godate.month.toString().padLeft(2, '0')}-${godate.day.toString().padLeft(2, '0')}",
    "distance": distance,
    "leavecity": leavecity,
    "destination": destination,
    "destaddress": destaddress,
    "leaveaddress": leaveaddress,
    "seats": seats,
  };
}
