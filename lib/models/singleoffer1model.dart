
// To parse this JSON data, do
//
//     final employprofilemodel = employprofilemodelFromJson(jsonString);

import 'dart:convert';

Singleoffer1Model singleoffer1ModelFromJson(String str) => Singleoffer1Model.fromJson(json.decode(str));

String singleoffer1ModelToJson(Singleoffer1Model data) => json.encode(data.toJson());

class Singleoffer1Model  {
  String? status;
  String? path;
  Detail? detail;
  String? gst;

  Singleoffer1Model({this.status, this.path, this.detail, this.gst});

  Singleoffer1Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    path = json['path'];
    detail =
    json['detail'] != null ? new Detail.fromJson(json['detail']) : null;
    gst = json['gst'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['path'] = this.path;
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    data['gst'] = this.gst;
    return data;
  }
}

class Detail {
  String? offertype;
  String? leaveDestFare;
  String? offerid;
  String? availSeat;
  String? leavecity;
  String? leaveStopFare;
  String? stopDestFare;
  String? destcity;
  String? stopcity;
  String? goDate;
  String? goTime;
  String? leaveaddress;
  String? destaddress;
  String? stopaddress;
  String? drivername;
  String? userimage;
  String? vehicleno;
  String? actype;
  String? vehicleid;
  String? weight;
  String? payloadweight;
  String? typename;
  String? distance;
  String? leaveToStop;
  String? avgRating;
  int? ratingCount;
  String? offerpriceType;

  Detail(
      {this.offertype,
        this.leaveDestFare,
        this.offerid,
        this.availSeat,
        this.leavecity,
        this.leaveStopFare,
        this.stopDestFare,
        this.destcity,
        this.stopcity,
        this.goDate,
        this.goTime,
        this.leaveaddress,
        this.destaddress,
        this.stopaddress,
        this.drivername,
        this.userimage,
        this.vehicleno,
        this.actype,
        this.vehicleid,
        this.weight,
        this.payloadweight,
        this.typename,
        this.distance,
        this.leaveToStop,
        this.avgRating,
        this.ratingCount,
        this.offerpriceType});

  Detail.fromJson(Map<String, dynamic> json) {
    offertype = json['offertype'];
    leaveDestFare = json['leave_dest_fare'];
    offerid = json['offerid'];
    availSeat = json['avail_seat'];
    leavecity = json['leavecity'];
    leaveStopFare = json['leave_stop_fare'];
    stopDestFare = json['stop_dest_fare'];
    destcity = json['destcity'];
    stopcity = json['stopcity'];
    goDate = json['go_date'];
    goTime = json['go_time'];
    leaveaddress = json['leaveaddress'];
    destaddress = json['destaddress'];
    stopaddress = json['stopaddress'];
    drivername = json['drivername'];
    userimage = json['userimage'];
    vehicleno = json['vehicleno'];
    actype = json['actype'];
    vehicleid = json['vehicleid'];
    weight = json['weight'];
    payloadweight = json['payloadweight'];
    typename = json['typename'];
    distance = json['distance'];
    leaveToStop = json['leave_to_stop'];
    avgRating = json['avg_rating'];
    ratingCount = json['rating_count'];
    offerpriceType = json['offerprice_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offertype'] = this.offertype;
    data['leave_dest_fare'] = this.leaveDestFare;
    data['offerid'] = this.offerid;
    data['avail_seat'] = this.availSeat;
    data['leavecity'] = this.leavecity;
    data['leave_stop_fare'] = this.leaveStopFare;
    data['stop_dest_fare'] = this.stopDestFare;
    data['destcity'] = this.destcity;
    data['stopcity'] = this.stopcity;
    data['go_date'] = this.goDate;
    data['go_time'] = this.goTime;
    data['leaveaddress'] = this.leaveaddress;
    data['destaddress'] = this.destaddress;
    data['stopaddress'] = this.stopaddress;
    data['drivername'] = this.drivername;
    data['userimage'] = this.userimage;
    data['vehicleno'] = this.vehicleno;
    data['actype'] = this.actype;
    data['vehicleid'] = this.vehicleid;
    data['weight'] = this.weight;
    data['payloadweight'] = this.payloadweight;
    data['typename'] = this.typename;
    data['distance'] = this.distance;
    data['leave_to_stop'] = this.leaveToStop;
    data['avg_rating'] = this.avgRating;
    data['rating_count'] = this.ratingCount;
    data['offerprice_type'] = this.offerpriceType;
    return data;
  }
}