// To parse this JSON data, do
//
//     final cartDataModel = cartDataModelFromJson(jsonString);

import 'dart:convert';

class CartDataModel {
  CartDataModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  final int id;
  final List<CartProduct> products;
  final int total;
  final int discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  factory CartDataModel.fromJson(Map<String, dynamic> json) => CartDataModel(
        id: json["id"],
        products: List<CartProduct>.from(json["products"].map((value) => CartProduct.fromJson(value))),
        total: json["total"],
        discountedTotal: json["discountedTotal"],
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
      );


}

class CartProduct {
  CartProduct({
   required this.id,
   required this.title,
   required this.price,
   required this.quantity,
   required this.total,
   required this.discountPercentage,
   required this.discountedPrice,
  });

  final int id;
  final String title;
  final int price;
  final int quantity;
  final int total;
  final double discountPercentage;
  final int discountedPrice;

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        discountPercentage: json["discountPercentage"].toDouble(),
        discountedPrice: json["discountedPrice"],
      );

}
