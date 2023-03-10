class Autogenerated {
  String? vVersion;
  String? mESSAGE;
  String? status;

  Autogenerated({this.vVersion, this.mESSAGE, this.status});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    vVersion = json['vVersion'];
    mESSAGE = json['MESSAGE'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vVersion'] = this.vVersion;
    data['MESSAGE'] = this.mESSAGE;
    data['status'] = this.status;
    return data;
  }
}