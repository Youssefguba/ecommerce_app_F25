import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/category_repo_model.dart';
import '../../repository/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void getAllCategories() async {
    final listOfCategories = await CategoryRepository().getAllCategories();
    emit(CategorySuccess(listOfCategories));
  }
}
