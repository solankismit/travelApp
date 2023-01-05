// To parse this JSON data, do
//
//     final bookinglist = bookinglistFromJson(jsonString);

import 'dart:convert';

Bookinglist bookinglistFromJson(String str) => Bookinglist.fromJson(json.decode(str));

String bookinglistToJson(Bookinglist data) => json.encode(data.toJson());

class Bookinglist {
  Bookinglist({
    required this.status,
    required this.detail,
  });

  String status;
  List<Detail> detail;

  factory Bookinglist.fromJson(Map<String, dynamic> json) => Bookinglist(
    status: json["status"],
    detail: List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    required this.id,
    required this.driverid,
    required this.bookuserid,
    required this.bookingrequestid,
    required this.offerid,
    required this.bookseats,
    required this.bookat,
    required this.totalfare,
    required this.status,
    required this.bookingtype,
    required this.distance,
    required this.transactionId,
    required this.nogstfare,
    required this.share,
    required this.checkstatus,
    required this.canreason,
    required this.goDate,
    required this.goTime,
    required this.leavecity,
    required this.destcity,
    required this.vehicleno,
    required this.name,
    required this.userimage,
    required this.ratingStatus,
  });

  String id;
  String driverid;
  String bookuserid;
  String bookingrequestid;
  String offerid;
  String bookseats;
  DateTime bookat;
  String totalfare;
  String status;
  String bookingtype;
  String distance;
  String transactionId;
  String nogstfare;
  String share;
  String checkstatus;
  String canreason;
  DateTime goDate;
  String goTime;
  String leavecity;
  String destcity;
  String vehicleno;
  String name;
  String userimage;
  int ratingStatus;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    driverid: json["driverid"],
    bookuserid: json["bookuserid"],
    bookingrequestid: json["bookingrequestid"],
    offerid: json["offerid"],
    bookseats: json["bookseats"],
    bookat: DateTime.parse(json["bookat"]),
    totalfare: json["totalfare"],
    status: json["status"],
    bookingtype: json["bookingtype"],
    distance: json["distance"],
    transactionId: json["transaction_id"],
    nogstfare: json["nogstfare"],
    share: json["share"],
    checkstatus: json["checkstatus"],
    canreason: json["canreason"],
    goDate: DateTime.parse(json["go_date"]),
    goTime: json["go_time"],
    leavecity: json["leavecity"],
    destcity: json["destcity"],
    vehicleno: json["vehicleno"],
    name: json["name"],
    userimage: json["userimage"],
    ratingStatus: json["rating_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "driverid": driverid,
    "bookuserid": bookuserid,
    "bookingrequestid": bookingrequestid,
    "offerid": offerid,
    "bookseats": bookseats,
    "bookat": bookat.toIso8601String(),
    "totalfare": totalfare,
    "status": status,
    "bookingtype": bookingtype,
    "distance": distance,
    "transaction_id": transactionId,
    "nogstfare": nogstfare,
    "share": share,
    "checkstatus": checkstatus,
    "canreason": canreason,
    "go_date": "${goDate.year.toString().padLeft(4, '0')}-${goDate.month.toString().padLeft(2, '0')}-${goDate.day.toString().padLeft(2, '0')}",
    "go_time": goTime,
    "leavecity": leavecity,
    "destcity": destcity,
    "vehicleno": vehicleno,
    "name": name,
    "userimage": userimage,
    "rating_status": ratingStatus,
  };
}
