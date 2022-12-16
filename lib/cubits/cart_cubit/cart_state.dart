part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class LoadingCart extends CartState {}

class CartSuccess extends CartState {
  final CartDataModel cartDataModel;
  CartSuccess(this.cartDataModel);

}