// To parse this JSON data, do
//
//     final walletreqModel = walletreqModelFromJson(jsonString);

import 'dart:convert';

WalletreqModel walletreqModelFromJson(String str) => WalletreqModel.fromJson(json.decode(str));

String walletreqModelToJson(WalletreqModel data) => json.encode(data.toJson());

class WalletreqModel {
  WalletreqModel({
    required this.status,
    required this.msg,
  });

  String status;
  String msg;

  factory WalletreqModel.fromJson(Map<String, dynamic> json) => WalletreqModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
