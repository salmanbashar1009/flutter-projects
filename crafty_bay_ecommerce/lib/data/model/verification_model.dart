class VerficationModel {
  String? msg;
  String? data;

  VerficationModel({this.msg, this.data});

  VerficationModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['data'] = this.data;
    return data;
  }
}
