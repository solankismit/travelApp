// To parse this JSON data, do
//
//     final confirmbookingmodel = confirmbookingmodelFromJson(jsonString);

import 'dart:convert';

Confirmbookingmodel confirmbookingmodelFromJson(String str) => Confirmbookingmodel.fromJson(json.decode(str));

String confirmbookingmodelToJson(Confirmbookingmodel data) => json.encode(data.toJson());

class Confirmbookingmodel {
  Confirmbookingmodel({
    required this.status,
    required this.path,
    required this.detail,
    required this.gst,
  });

  String status;
  String path;
  Detail detail;
  String gst;

  factory Confirmbookingmodel.fromJson(Map<String, dynamic> json) => Confirmbookingmodel(
    status: json["status"],
    path: json["path"],
    detail: Detail.fromJson(json["detail"]),
    gst: json["gst"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "path": path,
    "detail": detail.toJson(),
    "gst": gst,
  };
}

class Detail {
  Detail({
    required this.offertype,
    required this.leaveDestFare,
    required this.offerid,
    required this.availSeat,
    required this.leavecity,
    required this.leaveStopFare,
    required this.stopDestFare,
    required this.destcity,
    required this.stopcity,
    required this.goDate,
    required this.goTime,
    required this.leaveaddress,
    required this.destaddress,
    required this.stopaddress,
    required this.drivername,
    required this.userimage,
    required this.vehicleno,
    required this.actype,
    required this.vehicleid,
    required this.weight,
    required this.payloadweight,
    required this.typename,
    required this.distance,
    required this.leaveToStop,
    required this.avgRating,
    required this.ratingCount,
    required this.offerpriceType,
  });

  String offertype;
  String leaveDestFare;
  String offerid;
  String availSeat;
  String leavecity;
  String leaveStopFare;
  String stopDestFare;
  String destcity;
  String stopcity;
  DateTime goDate;
  String goTime;
  String leaveaddress;
  String destaddress;
  String stopaddress;
  String drivername;
  String userimage;
  String vehicleno;
  String actype;
  String vehicleid;
  String weight;
  String payloadweight;
  String typename;
  String distance;
  String leaveToStop;
  int avgRating;
  int ratingCount;
  String offerpriceType;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    offertype: json["offertype"],
    leaveDestFare: json["leave_dest_fare"],
    offerid: json["offerid"],
    availSeat: json["avail_seat"],
    leavecity: json["leavecity"],
    leaveStopFare: json["leave_stop_fare"],
    stopDestFare: json["stop_dest_fare"],
    destcity: json["destcity"],
    stopcity: json["stopcity"],
    goDate: DateTime.parse(json["go_date"]),
    goTime: json["go_time"],
    leaveaddress: json["leaveaddress"],
    destaddress: json["destaddress"],
    stopaddress: json["stopaddress"],
    drivername: json["drivername"],
    userimage: json["userimage"],
    vehicleno: json["vehicleno"],
    actype: json["actype"],
    vehicleid: json["vehicleid"],
    weight: json["weight"],
    payloadweight: json["payloadweight"],
    typename: json["typename"],
    distance: json["distance"],
    leaveToStop: json["leave_to_stop"],
    avgRating: json["avg_rating"],
    ratingCount: json["rating_count"],
    offerpriceType: json["offerprice_type"],
  );

  Map<String, dynamic> toJson() => {
    "offertype": offertype,
    "leave_dest_fare": leaveDestFare,
    "offerid": offerid,
    "avail_seat": availSeat,
    "leavecity": leavecity,
    "leave_stop_fare": leaveStopFare,
    "stop_dest_fare": stopDestFare,
    "destcity": destcity,
    "stopcity": stopcity,
    "go_date": "${goDate.year.toString().padLeft(4, '0')}-${goDate.month.toString().padLeft(2, '0')}-${goDate.day.toString().padLeft(2, '0')}",
    "go_time": goTime,
    "leaveaddress": leaveaddress,
    "destaddress": destaddress,
    "stopaddress": stopaddress,
    "drivername": drivername,
    "userimage": userimage,
    "vehicleno": vehicleno,
    "actype": actype,
    "vehicleid": vehicleid,
    "weight": weight,
    "payloadweight": payloadweight,
    "typename": typename,
    "distance": distance,
    "leave_to_stop": leaveToStop,
    "avg_rating": avgRating,
    "rating_count": ratingCount,
    "offerprice_type": offerpriceType,
  };
}
