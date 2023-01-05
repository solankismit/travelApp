class parcelscheduleride_model {
  List<Data>? data;
  String? status;
  String? msg;

  parcelscheduleride_model({this.data, this.status, this.msg});

  parcelscheduleride_model.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
}

class Data {
  String? userid;
  String? name;
  String? mobile;
  String? goDate;
  String? goTime;
  String? vehicleid;
  String? vehicleno;
  String? leavecity;
  String? destcity;
  String? offertype;

  Data(
      {this.userid,
        this.name,
        this.mobile,
        this.goDate,
        this.goTime,
        this.vehicleid,
        this.vehicleno,
        this.leavecity,
        this.destcity,
        this.offertype});

  Data.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    name = json['name'];
    mobile = json['mobile'];
    goDate = json['go_date'];
    goTime = json['go_time'];
    vehicleid = json['vehicleid'];
    vehicleno = json['vehicleno'];
    leavecity = json['leavecity'];
    destcity = json['destcity'];
    offertype = json['offertype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['go_date'] = this.goDate;
    data['go_time'] = this.goTime;
    data['vehicleid'] = this.vehicleid;
    data['vehicleno'] = this.vehicleno;
    data['leavecity'] = this.leavecity;
    data['destcity'] = this.destcity;
    data['offertype'] = this.offertype;
    return data;
  }
}
