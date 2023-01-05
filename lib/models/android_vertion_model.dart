class android_vertion_model {
  String? vVersion;
  String? MESSAGE;
  String? status;
  String? eStatus;

  android_vertion_model({this.vVersion, this.MESSAGE, this.status,this.eStatus});

  android_vertion_model.fromJson(Map<String, dynamic> json) {
    vVersion = json['vVersion'];
    MESSAGE = json['MESSAGE'];
    status = json['status'];
    eStatus = json['eStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vVersion'] = this.vVersion;
    data['MESSAGE'] = this.MESSAGE;
    data['status'] = this.status;
    data['eStatus'] = this.eStatus;
    return data;
  }
}
