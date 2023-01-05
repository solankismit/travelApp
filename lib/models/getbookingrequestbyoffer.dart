// To parse this JSON data, do
//
//     final getbookingrequestbyoffer = getbookingrequestbyofferFromJson(jsonString);

import 'dart:convert';

Getbookingrequestbyoffer getbookingrequestbyofferFromJson(String str) => Getbookingrequestbyoffer.fromJson(json.decode(str));

String getbookingrequestbyofferToJson(Getbookingrequestbyoffer data) => json.encode(data.toJson());

class Getbookingrequestbyoffer {
  Getbookingrequestbyoffer({
    required this.status,
    required this.detail,
  });

  String status;
  List<Detail> detail;

  factory Getbookingrequestbyoffer.fromJson(Map<String, dynamic> json) => Getbookingrequestbyoffer(
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
    required this.bookuserid,
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
    required this.bookingrequestid,
    required this.name,
    required this.mobile,
    required this.userimage,
  });

  String id;
  String bookuserid;
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
  String bookingrequestid;
  String name;
  String mobile;
  String userimage;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    bookuserid: json["bookuserid"],
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
    bookingrequestid: json["bookingrequestid"],
    name: json["name"],
    mobile: json["mobile"],
    userimage: json["userimage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bookuserid": bookuserid,
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
    "bookingrequestid": bookingrequestid,
    "name": name,
    "mobile": mobile,
    "userimage": userimage,
  };
}
