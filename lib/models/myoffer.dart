// To parse this JSON data, do
//
//     final myoffer = myofferFromJson(jsonString);

import 'dart:convert';

Myoffer myofferFromJson(String str) => Myoffer.fromJson(json.decode(str));

String myofferToJson(Myoffer data) => json.encode(data.toJson());

class Myoffer {
  Myoffer({
    required this.status,
    required this.detail,
  });

  String status;
  List<Detail> detail;

  factory Myoffer.fromJson(Map<String, dynamic> json) => Myoffer(
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
    required this.userid,
    required this.vehicleid,
    required this.leaveLong,
    required this.leaveLat,
    required this.destLong,
    required this.destLat,
    required this.goDate,
    required this.goTime,
    required this.availSeat,
    this.stopLong1,
    this.stopLat1,
    required this.stopLong2,
    required this.stopLat2,
    required this.offerStatus,
    required this.createdAt,
    required this.leavecity,
    required this.destcity,
    this.stopcity,
    required this.distance,
    required this.leaveToStop,
    required this.stopToDestination,
    required this.leaveDestFare,
    required this.leaveStopFare,
    required this.leaveaddress,
    required this.destaddress,
    this.stopaddress,
    required this.offerpriceType,
    required this.stopDestFare,
    required this.offertype,
    required this.booked,
    required this.nogstLeavedest,
    required this.nogstStopdest,
    required this.nogstLeavestop,
    required this.totalBookingRequest,
    required this.totalBookingAccept,
  });

  String id;
  String userid;
  String vehicleid;
  String leaveLong;
  String leaveLat;
  String destLong;
  String destLat;
  DateTime goDate;
  String goTime;
  String availSeat;
  dynamic stopLong1;
  dynamic stopLat1;
  String stopLong2;
  String stopLat2;
  String offerStatus;
  DateTime createdAt;
  String leavecity;
  String destcity;
  dynamic stopcity;
  String distance;
  String leaveToStop;
  String stopToDestination;
  String leaveDestFare;
  String leaveStopFare;
  String leaveaddress;
  String destaddress;
  dynamic stopaddress;
  String offerpriceType;
  String stopDestFare;
  String offertype;
  String booked;
  String nogstLeavedest;
  String nogstStopdest;
  String nogstLeavestop;
  String totalBookingRequest;
  String totalBookingAccept;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    userid: json["userid"],
    vehicleid: json["vehicleid"],
    leaveLong: json["leave_long"],
    leaveLat: json["leave_lat"],
    destLong: json["dest_long"],
    destLat: json["dest_lat"],
    goDate: DateTime.parse(json["go_date"]),
    goTime: json["go_time"],
    availSeat: json["avail_seat"],
    stopLong1: json["stop_long1"],
    stopLat1: json["stop_lat1"],
    stopLong2: json["stop_long2"],
    stopLat2: json["stop_lat2"],
    offerStatus: json["offer_status"],
    createdAt: DateTime.parse(json["created_at"]),
    leavecity: json["leavecity"],
    destcity: json["destcity"],
    stopcity: json["stopcity"],
    distance: json["distance"],
    leaveToStop: json["leave_to_stop"],
    stopToDestination: json["stop_to_destination"],
    leaveDestFare: json["leave_dest_fare"],
    leaveStopFare: json["leave_stop_fare"],
    leaveaddress: json["leaveaddress"],
    destaddress: json["destaddress"],
    stopaddress: json["stopaddress"],
    offerpriceType: json["offerprice_type"],
    stopDestFare: json["stop_dest_fare"],
    offertype: json["offertype"],
    booked: json["booked"],
    nogstLeavedest: json["nogst_leavedest"],
    nogstStopdest: json["nogst_stopdest"],
    nogstLeavestop: json["nogst_leavestop"],
    totalBookingRequest: json["total_booking_request"],
    totalBookingAccept: json["total_booking_accept"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "vehicleid": vehicleid,
    "leave_long": leaveLong,
    "leave_lat": leaveLat,
    "dest_long": destLong,
    "dest_lat": destLat,
    "go_date": "${goDate.year.toString().padLeft(4, '0')}-${goDate.month.toString().padLeft(2, '0')}-${goDate.day.toString().padLeft(2, '0')}",
    "go_time": goTime,
    "avail_seat": availSeat,
    "stop_long1": stopLong1,
    "stop_lat1": stopLat1,
    "stop_long2": stopLong2,
    "stop_lat2": stopLat2,
    "offer_status": offerStatus,
    "created_at": createdAt.toIso8601String(),
    "leavecity": leavecity,
    "destcity": destcity,
    "stopcity": stopcity,
    "distance": distance,
    "leave_to_stop": leaveToStop,
    "stop_to_destination": stopToDestination,
    "leave_dest_fare": leaveDestFare,
    "leave_stop_fare": leaveStopFare,
    "leaveaddress": leaveaddress,
    "destaddress": destaddress,
    "stopaddress": stopaddress,
    "offerprice_type": offerpriceType,
    "stop_dest_fare": stopDestFare,
    "offertype": offertype,
    "booked": booked,
    "nogst_leavedest": nogstLeavedest,
    "nogst_stopdest": nogstStopdest,
    "nogst_leavestop": nogstLeavestop,
    "total_booking_request": totalBookingRequest,
    "total_booking_accept": totalBookingAccept,
  };
}
