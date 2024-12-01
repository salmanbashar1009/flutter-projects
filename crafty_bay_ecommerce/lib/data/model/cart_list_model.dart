import 'package:crafty_bay_ecommerce/data/model/Product_details.dart';
import 'package:crafty_bay_ecommerce/data/model/cart_data.dart';

class CartListModel {
  String? msg;
  List<CartData>? data;

  CartListModel({this.msg, this.data});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CartData>[];
      json['data'].forEach((v) {
        data!.add(CartData.fromJson(v));
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




