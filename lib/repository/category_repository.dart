import 'package:dio/dio.dart';

import '../model/category_products_model.dart';
import '../model/category_repo_model.dart';

class CategoryRepository {
  Future<List<CategoryRepoModel>> getAllCategories() async {
    // steps 2 --> fetching
    final response = await Dio()
        .get('https://mocki.io/v1/e5775744-06ba-4306-b6f6-93055de3c2d5');

    // step 3 --> modeling
    // item dynamic -> item of CategoryRepoModel -> convert to List of CategoryRepoModel
    final listOfCategories = List<CategoryRepoModel>.from(
      response.data.map(
        (value) => CategoryRepoModel(
          id: value['id'],
          name: value['name'],
          image: value['image'],
        ),
      ),
    );

    print(listOfCategories);
    return listOfCategories;
  }

  Future<List<ProductModel>> getProductsByCategory(String categoryName) async {
    final response =
        await Dio().get('https://dummyjson.com/products/category/$categoryName');

    final categoryProducts = CategoryProducts.fromJson(response.data);

    return categoryProducts.products;
  }
}