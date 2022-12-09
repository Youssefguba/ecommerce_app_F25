part of 'category_cubit.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryNotFound extends CategoryState {}

class CategorySuccess extends CategoryState {
  List<CategoryRepoModel> list;
  CategorySuccess(this.list);
}

class NoInternetConnection extends CategoryState {}

class ErrorInCategory extends CategoryState {
  Exception error;

  ErrorInCategory(this.error);
}

class LoadingCategories extends CategoryState {}
