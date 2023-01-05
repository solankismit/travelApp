// To parse this JSON data, do
//
//     final getpickparceldetailmodel = getpickparceldetailmodelFromJson(jsonString);

import 'dart:convert';

Getpickparceldetailmodel getpickparceldetailmodelFromJson(String str) => Getpickparceldetailmodel.fromJson(json.decode(str));

String getpickparceldetailmodelToJson(Getpickparceldetailmodel data) => json.encode(data.toJson());

class Getpickparceldetailmodel {
  Getpickparceldetailmodel({
    required this.data,
    required this.status,
    required this.msg,
  });

  Data data;
  String status;
  String msg;

  factory Getpickparceldetailmodel.fromJson(Map<String, dynamic> json) => Getpickparceldetailmodel(
    data: Data.fromJson(json["data"]),
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "status": status,
    "msg": msg,
  };
}

class Data {
  Data({
    required this.iSendParcelId,
    required this.iSenderId,
    required this.tFromLocation,
    required this.tToLocation,
    required this.vFromCity,
    required this.vToCity,
    required this.dFromLocationLat,
    required this.dFromLocationLong,
    required this.dToLocationLat,
    required this.dToLocationLong,
    required this.tItemName,
    required this.dItemValue,
    required this.eItemSize,
    required this.vItemPhoto,
    required this.dItemWeight,
    required this.tItemDimention,
    required this.dItemLength,
    required this.dItemWidth,
    required this.dItemHeight,
    required this.tExtraDetails,
    required this.eWhoWillMeetDriverAtPickupLocation,
    required this.vSenderName,
    required this.vSenderMobile,
    required this.eWhoWillMeetDriverAtDeliveryLocation,
    required this.vReceiverName,
    required this.vReceiverMobile,
    required this.ePickupTime,
    required this.ePickupDateTime,
    required this.eRecieveTime,
    required this.eReceiveDateTime,
    required this.eSendParcelStatus,
    required this.iAcceptRequestDriverId,
    required this.isDelete,
    required this.dtCreated,
    required this.dtModified,
  });

  String iSendParcelId;
  String iSenderId;
  String tFromLocation;
  String tToLocation;
  String vFromCity;
  String vToCity;
  String dFromLocationLat;
  String dFromLocationLong;
  String dToLocationLat;
  String dToLocationLong;
  String tItemName;
  String dItemValue;
  String eItemSize;
  String vItemPhoto;
  String dItemWeight;
  String tItemDimention;
  String dItemLength;
  String dItemWidth;
  String dItemHeight;
  String tExtraDetails;
  String eWhoWillMeetDriverAtPickupLocation;
  String vSenderName;
  String vSenderMobile;
  String eWhoWillMeetDriverAtDeliveryLocation;
  String vReceiverName;
  String vReceiverMobile;
  String ePickupTime;
  String ePickupDateTime;
  String eRecieveTime;
  String eReceiveDateTime;
  String eSendParcelStatus;
  String iAcceptRequestDriverId;
  String isDelete;
  DateTime dtCreated;
  DateTime dtModified;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    iSendParcelId: json["iSendParcelID"],
    iSenderId: json["iSenderID"],
    tFromLocation: json["tFromLocation"],
    tToLocation: json["tToLocation"],
    vFromCity: json["vFromCity"],
    vToCity: json["vToCity"],
    dFromLocationLat: json["dFromLocationLat"],
    dFromLocationLong: json["dFromLocationLong"],
    dToLocationLat: json["dToLocationLat"],
    dToLocationLong: json["dToLocationLong"],
    tItemName: json["tItemName"],
    dItemValue: json["dItemValue"],
    eItemSize: json["eItemSize"],
    vItemPhoto: json["vItemPhoto"],
    dItemWeight: json["dItemWeight"],
    tItemDimention: json["tItemDimention"],
    dItemLength: json["dItemLength"],
    dItemWidth: json["dItemWidth"],
    dItemHeight: json["dItemHeight"],
    tExtraDetails: json["tExtraDetails"],
    eWhoWillMeetDriverAtPickupLocation: json["eWhoWillMeetDriverAtPickupLocation"],
    vSenderName: json["vSenderName"],
    vSenderMobile: json["vSenderMobile"],
    eWhoWillMeetDriverAtDeliveryLocation: json["eWhoWillMeetDriverAtDeliveryLocation"],
    vReceiverName: json["vReceiverName"],
    vReceiverMobile: json["vReceiverMobile"],
    ePickupTime: json["ePickupTime"],
    ePickupDateTime: json["ePickupDateTime"],
    eRecieveTime: json["eRecieveTime"],
    eReceiveDateTime: json["eReceiveDateTime"],
    eSendParcelStatus: json["eSendParcelStatus"],
    iAcceptRequestDriverId: json["iAcceptRequestDriverID"],
    isDelete: json["isDelete"],
    dtCreated: DateTime.parse(json["dtCreated"]),
    dtModified: DateTime.parse(json["dtModified"]),
  );

  Map<String, dynamic> toJson() => {
    "iSendParcelID": iSendParcelId,
    "iSenderID": iSenderId,
    "tFromLocation": tFromLocation,
    "tToLocation": tToLocation,
    "vFromCity": vFromCity,
    "vToCity": vToCity,
    "dFromLocationLat": dFromLocationLat,
    "dFromLocationLong": dFromLocationLong,
    "dToLocationLat": dToLocationLat,
    "dToLocationLong": dToLocationLong,
    "tItemName": tItemName,
    "dItemValue": dItemValue,
    "eItemSize": eItemSize,
    "vItemPhoto": vItemPhoto,
    "dItemWeight": dItemWeight,
    "tItemDimention": tItemDimention,
    "dItemLength": dItemLength,
    "dItemWidth": dItemWidth,
    "dItemHeight": dItemHeight,
    "tExtraDetails": tExtraDetails,
    "eWhoWillMeetDriverAtPickupLocation": eWhoWillMeetDriverAtPickupLocation,
    "vSenderName": vSenderName,
    "vSenderMobile": vSenderMobile,
    "eWhoWillMeetDriverAtDeliveryLocation": eWhoWillMeetDriverAtDeliveryLocation,
    "vReceiverName": vReceiverName,
    "vReceiverMobile": vReceiverMobile,
    "ePickupTime": ePickupTime,
    "ePickupDateTime": ePickupDateTime,
    "eRecieveTime": eRecieveTime,
    "eReceiveDateTime": eReceiveDateTime,
    "eSendParcelStatus": eSendParcelStatus,
    "iAcceptRequestDriverID": iAcceptRequestDriverId,
    "isDelete": isDelete,
    "dtCreated": dtCreated.toIso8601String(),
    "dtModified": dtModified.toIso8601String(),
  };
}
