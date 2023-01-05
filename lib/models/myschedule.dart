// To parse this JSON data, do
//
//     final myschedule = myscheduleFromJson(jsonString);

import 'dart:convert';

Myschedule myscheduleFromJson(String str) => Myschedule.fromJson(json.decode(str));

String myscheduleToJson(Myschedule data) => json.encode(data.toJson());

class Myschedule {
  Myschedule({
    required this.status,
    required this.path,
    required this.detail,
  });

  String status;
  String path;
  List<Detail> detail;

  factory Myschedule.fromJson(Map<String, dynamic> json) => Myschedule(
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
    required this.vehicleid,
    required this.leaveLong,
    required this.leaveLat,
    required this.destLong,
    required this.destLat,
    required this.goDate,
    required this.goTime,
    required this.availSeat,
    required this.scheduleRideBy,
    required this.scheduleRideData,
    required this.leaveaddress,
    required this.destaddress,
    required this.leavecity,
    required this.destcity,
    required this.distance,
    required this.offertype,
    required this.offerpriceType,
    required this.leaveDestFare,
    required this.nogstLeavedest,
    required this.dtCreated,
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
  String scheduleRideBy;
  String scheduleRideData;
  String leaveaddress;
  String destaddress;
  String leavecity;
  String destcity;
  String distance;
  String offertype;
  String offerpriceType;
  String leaveDestFare;
  String nogstLeavedest;
  DateTime dtCreated;

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
    scheduleRideBy: json["schedule_ride_by"],
    scheduleRideData: json["schedule_ride_data"],
    leaveaddress: json["leaveaddress"],
    destaddress: json["destaddress"],
    leavecity: json["leavecity"],
    destcity: json["destcity"],
    distance: json["distance"],
    offertype: json["offertype"],
    offerpriceType: json["offerprice_type"],
    leaveDestFare: json["leave_dest_fare"],
    nogstLeavedest: json["nogst_leavedest"],
    dtCreated: DateTime.parse(json["dtCreated"]),
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
    "schedule_ride_by": scheduleRideBy,
    "schedule_ride_data": scheduleRideData,
    "leaveaddress": leaveaddress,
    "destaddress": destaddress,
    "leavecity": leavecity,
    "destcity": destcity,
    "distance": distance,
    "offertype": offertype,
    "offerprice_type": offerpriceType,
    "leave_dest_fare": leaveDestFare,
    "nogst_leavedest": nogstLeavedest,
    "dtCreated": dtCreated.toIso8601String(),
  };
}
