// To parse this JSON data, do
//
//     final passengerconfirmhirevehiclerequestModel = passengerconfirmhirevehiclerequestModelFromJson(jsonString);

import 'dart:convert';

PassengerconfirmhirevehiclerequestModel passengerconfirmhirevehiclerequestModelFromJson(String str) => PassengerconfirmhirevehiclerequestModel.fromJson(json.decode(str));

String passengerconfirmhirevehiclerequestModelToJson(PassengerconfirmhirevehiclerequestModel data) => json.encode(data.toJson());

class PassengerconfirmhirevehiclerequestModel {
  PassengerconfirmhirevehiclerequestModel({
    required this.passengerConfirmRequests,
    required this.status,
    required this.msg,
  });

  List<PassengerConfirmRequest> passengerConfirmRequests;
  String status;
  String msg;

  factory PassengerconfirmhirevehiclerequestModel.fromJson(Map<String, dynamic> json) => PassengerconfirmhirevehiclerequestModel(
    passengerConfirmRequests: List<PassengerConfirmRequest>.from(json["PassengerConfirmRequests"].map((x) => PassengerConfirmRequest.fromJson(x))),
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "PassengerConfirmRequests": List<dynamic>.from(passengerConfirmRequests.map((x) => x.toJson())),
    "status": status,
    "msg": msg,
  };
}

class PassengerConfirmRequest {
  PassengerConfirmRequest({
    required this.passengerName,
    required this.passengerMobile,
    required this.vPickupLocation,
    required this.vDropLocation,
    required this.vCity,
    required this.eVehicleType,
    required this.driverName,
    required this.driverMobile,
    required this.driverVehicleNo,
    required this.driverBiddingRate,
    required this.requestBookingDate,
    required this.requestBookingTime,
  });

  String passengerName;
  String passengerMobile;
  String vPickupLocation;
  String vDropLocation;
  String vCity;
  String eVehicleType;
  String driverName;
  String driverMobile;
  String driverVehicleNo;
  String driverBiddingRate;
  DateTime requestBookingDate;
  String requestBookingTime;

  factory PassengerConfirmRequest.fromJson(Map<String, dynamic> json) => PassengerConfirmRequest(
    passengerName: json["passenger_name"],
    passengerMobile: json["passenger_mobile"],
    vPickupLocation: json["vPickupLocation"],
    vDropLocation: json["vDropLocation"],
    vCity: json["vCity"],
    eVehicleType: json["eVehicleType"],
    driverName: json["driver_name"],
    driverMobile: json["driver_mobile"],
    driverVehicleNo: json["driver_vehicle_no"],
    driverBiddingRate: json["driver_bidding_rate"],
    requestBookingDate: DateTime.parse(json["request_booking_date"]),
    requestBookingTime: json["request_booking_time"],
  );

  Map<String, dynamic> toJson() => {
    "passenger_name": passengerName,
    "passenger_mobile": passengerMobile,
    "vPickupLocation": vPickupLocation,
    "vDropLocation": vDropLocation,
    "vCity": vCity,
    "eVehicleType": eVehicleType,
    "driver_name": driverName,
    "driver_mobile": driverMobile,
    "driver_vehicle_no": driverVehicleNo,
    "driver_bidding_rate": driverBiddingRate,
    "request_booking_date": "${requestBookingDate.year.toString().padLeft(4, '0')}-${requestBookingDate.month.toString().padLeft(2, '0')}-${requestBookingDate.day.toString().padLeft(2, '0')}",
    "request_booking_time": requestBookingTime,
  };
}
