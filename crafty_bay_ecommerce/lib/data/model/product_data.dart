import 'package:crafty_bay_ecommerce/data/model/brand.dart';
import 'package:crafty_bay_ecommerce/data/model/category_list_data.dart';

class ProductData {
  int? id;
  String? title;
  String? shortDes;
  String? price;
  int? discount;
  String? discountPrice;
  String? image;
  int? stock;
  int? star;
  String? remark;
  int? categoryId;
  int? brandId;
  String? createdAt;
  String? updatedAt;
  Brand? brand;
  CategoryListData? category;

  ProductData(
      {this.id,
        this.title,
        this.shortDes,
        this.price,
        this.discount,
        this.discountPrice,
        this.image,
        this.stock,
        this.star,
        this.remark,
        this.categoryId,
        this.brandId,
        this.createdAt,
        this.updatedAt,
        this.brand,
        this.category});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
    stock = json['stock'];
    star = json['star'];
    remark = json['remark'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    category = json['category'] != null
        ? CategoryListData.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['short_des'] = shortDes;
    data['price'] = price;
    data['discount'] = discount;
    data['discount_price'] = discountPrice;
    data['image'] = image;
    data['stock'] = stock;
    data['star'] = star;
    data['remark'] = remark;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}