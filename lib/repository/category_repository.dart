import 'package:dio/dio.dart';

import '../model/category_repo_model.dart';

class CategoryRepository {
  Future<List<CategoryRepoModel>> getAllCategories() async {
    final response =
        await Dio().get('https://api.escuelajs.co/api/v1/categories/');


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

    return listOfCategories;
  }
}