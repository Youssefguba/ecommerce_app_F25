import 'package:dio/dio.dart';
import 'package:ecommerce_app/model/category_products_model.dart';

class ProductRepository {
  Future<ProductModel> getSingleProduct(int productId) async {
    final response =
        await Dio().get('https://dummyjson.com/products/$productId');

    final product = ProductModel.fromJson(response.data);

    return product;
  }
}
