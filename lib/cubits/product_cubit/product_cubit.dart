import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/model/category_products_model.dart';
import 'package:ecommerce_app/repository/product_repository.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getSingleProduct(int productId) async {
    final productData = await ProductRepository().getSingleProduct(productId);
    emit(GetProductSuccess(productData));
  }
}
