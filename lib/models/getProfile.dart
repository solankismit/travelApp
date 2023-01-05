class Getprofile {
  String? status;
  String? path;
  Detail? detail;
  String? userImage;

  Getprofile({this.status, this.path, this.detail, this.userImage});

  Getprofile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    path = json['path'];
    detail =
    json['detail'] != null ? new Detail.fromJson(json['detail']) : null;
    userImage = json['UserImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['path'] = this.path;
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    data['UserImage'] = this.userImage;
    return data;
  }
}

class Detail {
  String? id;
  String? name;
  String? email;
  String? password;
  String? rememberMe;
  String? createdAt;
  String? updatedAt;
  String? statuschangeat;
  String? type;
  String? mobile;
  String? status;
  Null? birthyear;
  String? age;
  String? gender;
  String? userimage;
  String? request;
  String? otp;
  String? roleid;
  String? bio;
  String? chat;
  String? smoke;
  String? music;
  String? pet;
  String? aC;
  String? wallet;
  String? address;
  String? redeemReq;
  String? devicetype;
  String? devicetoken;
  String? deviceid;
  String? ratestatus;
  String? driverrate;
  String? offeridrate;
  String? fname;
  String? lname;

  Detail(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.rememberMe,
        this.createdAt,
        this.updatedAt,
        this.statuschangeat,
        this.type,
        this.mobile,
        this.status,
        this.birthyear,
        this.age,
        this.gender,
        this.userimage,
        this.request,
        this.otp,
        this.roleid,
        this.bio,
        this.chat,
        this.smoke,
        this.music,
        this.pet,
        this.aC,
        this.wallet,
        this.address,
        this.redeemReq,
        this.devicetype,
        this.devicetoken,
        this.deviceid,
        this.ratestatus,
        this.driverrate,
        this.offeridrate,
        this.fname,
        this.lname});

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    rememberMe = json['remember_me'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    statuschangeat = json['statuschangeat'];
    type = json['type'];
    mobile = json['mobile'];
    status = json['status'];
    birthyear = json['birthyear'];
    age = json['age'];
    gender = json['gender'];
    userimage = json['userimage'];
    request = json['request'];
    otp = json['otp'];
    roleid = json['roleid'];
    bio = json['bio'];
    chat = json['chat'];
    smoke = json['smoke'];
    music = json['music'];
    pet = json['pet'];
    aC = json['AC'];
    wallet = json['wallet'];
    address = json['address'];
    redeemReq = json['redeem_req'];
    devicetype = json['devicetype'];
    devicetoken = json['devicetoken'];
    deviceid = json['deviceid'];
    ratestatus = json['ratestatus'];
    driverrate = json['driverrate'];
    offeridrate = json['offeridrate'];
    fname = json['fname'];
    lname = json['lname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['remember_me'] = this.rememberMe;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['statuschangeat'] = this.statuschangeat;
    data['type'] = this.type;
    data['mobile'] = this.mobile;
    data['status'] = this.status;
    data['birthyear'] = this.birthyear;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['userimage'] = this.userimage;
    data['request'] = this.request;
    data['otp'] = this.otp;
    data['roleid'] = this.roleid;
    data['bio'] = this.bio;
    data['chat'] = this.chat;
    data['smoke'] = this.smoke;
    data['music'] = this.music;
    data['pet'] = this.pet;
    data['AC'] = this.aC;
    data['wallet'] = this.wallet;
    data['address'] = this.address;
    data['redeem_req'] = this.redeemReq;
    data['devicetype'] = this.devicetype;
    data['devicetoken'] = this.devicetoken;
    data['deviceid'] = this.deviceid;
    data['ratestatus'] = this.ratestatus;
    data['driverrate'] = this.driverrate;
    data['offeridrate'] = this.offeridrate;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    return data;
  }
}
