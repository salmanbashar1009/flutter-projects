import 'package:crafty_bay_ecommerce/data/model/category_list_data.dart';

class CategoryListModel {
  String? msg;
  List<CategoryListData>? data;

  CategoryListModel({this.msg, this.data});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CategoryListData>[];
      json['data'].forEach((v) {
        data!.add(CategoryListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

