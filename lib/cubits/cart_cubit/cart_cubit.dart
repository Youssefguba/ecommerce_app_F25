import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/model/category_products_model.dart';
import 'package:ecommerce_app/repository/cart_repository.dart';
import 'package:ecommerce_app/repository/product_repository.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getAllCartData() async {
    emit(LoadingCart()); //loading

    final cart = await CartRepository().getCarts();

    List<ProductModel> listOfProduct = [];

    for (var i = 0; i < cart.products.length; i++) {
      final product =
          await ProductRepository().getSingleProduct(cart.products[i].id);
      listOfProduct.add(product);
    }
    emit(CartSuccess(cart)); // success
  }
}
