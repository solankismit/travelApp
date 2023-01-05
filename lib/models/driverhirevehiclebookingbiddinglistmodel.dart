// To parse this JSON data, do
//
//     final driverhirevehiclebookingbiddinglistModel = driverhirevehiclebookingbiddinglistModelFromJson(jsonString);

import 'dart:convert';

DriverhirevehiclebookingbiddinglistModel driverhirevehiclebookingbiddinglistModelFromJson(String str) => DriverhirevehiclebookingbiddinglistModel.fromJson(json.decode(str));

String driverhirevehiclebookingbiddinglistModelToJson(DriverhirevehiclebookingbiddinglistModel data) => json.encode(data.toJson());

class DriverhirevehiclebookingbiddinglistModel {
  DriverhirevehiclebookingbiddinglistModel({
    required this.driverBiddingList,
    required this.status,
    required this.msg,
  });

  List<DriverBiddingList> driverBiddingList;
  String status;
  String msg;

  factory DriverhirevehiclebookingbiddinglistModel.fromJson(Map<String, dynamic> json) => DriverhirevehiclebookingbiddinglistModel(
    driverBiddingList: List<DriverBiddingList>.from(json["DriverBiddingList"].map((x) => DriverBiddingList.fromJson(x))),
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "DriverBiddingList": List<dynamic>.from(driverBiddingList.map((x) => x.toJson())),
    "status": status,
    "msg": msg,
  };
}

class DriverBiddingList {
  DriverBiddingList({
    required this.driverName,
    required this.driverMobile,
    required this.dBiddingRate,
    required this.biddingStatus,
    required this.requestPickupLocation,
    required this.requestDropLocation,
    required this.preferCity,
    required this.dtRequestBooking,
    required this.tmRequestBooking,
    required this.bookingRequestStatus,
    required this.passengerName,
    required this.passengerMobile,
    required this.driverVehicleNo,
  });

  String driverName;
  String driverMobile;
  String dBiddingRate;
  String biddingStatus;
  String requestPickupLocation;
  String requestDropLocation;
  String preferCity;
  String dtRequestBooking;
  String tmRequestBooking;
  String bookingRequestStatus;
  String passengerName;
  String passengerMobile;
  String driverVehicleNo;

  factory DriverBiddingList.fromJson(Map<String, dynamic> json) => DriverBiddingList(
    driverName: json["driver_name"],
    driverMobile: json["driver_mobile"],
    dBiddingRate: json["dBiddingRate"],
    biddingStatus: json["bidding_status"],
    requestPickupLocation: json["request_pickup_location"],
    requestDropLocation: json["request_drop_location"],
    preferCity: json["prefer_city"],
    dtRequestBooking: json["dtRequestBooking"],
    tmRequestBooking: json["tmRequestBooking"],
    bookingRequestStatus: json["booking_request_status"],
    passengerName: json["passenger_name"],
    passengerMobile: json["passenger_mobile"],
    driverVehicleNo: json["driver_vehicle_no"],
  );

  Map<String, dynamic> toJson() => {
    "driver_name": driverName,
    "driver_mobile": driverMobile,
    "dBiddingRate": dBiddingRate,
    "bidding_status": biddingStatus,
    "request_pickup_location": requestPickupLocation,
    "request_drop_location": requestDropLocation,
    "prefer_city": preferCity,
    "dtRequestBooking": dtRequestBooking,
    "tmRequestBooking": tmRequestBooking,
    "booking_request_status": bookingRequestStatus,
    "passenger_name": passengerName,
    "passenger_mobile": passengerMobile,
    "driver_vehicle_no": driverVehicleNo,
  };
}
