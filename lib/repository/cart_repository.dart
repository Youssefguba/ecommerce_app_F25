import 'package:dio/dio.dart';
import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/repository/product_repository.dart';

import '../model/category_products_model.dart';

class CartRepository {
  Future<CartDataModel> getCarts() async {
    final response = await Dio().get('https://dummyjson.com/carts/1');
    final model = CartDataModel.fromJson(response.data);
    return model;
  }
}
