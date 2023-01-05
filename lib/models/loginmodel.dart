// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.status,
    required this.id,
    required this.type,
    required this.mobile,
    required this.gender,
  });

  String status;
  String? id;
  String? type;
  String? mobile;
  String? gender;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    id: json["id"],
    type: json["type"],
    mobile: json["mobile"],
    gender: json["gender"],

  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "id": id,
    "type": type,
    "mobile": mobile,
    "gender": gender,
  };
}
