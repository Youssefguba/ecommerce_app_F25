import 'package:ecommerce_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getAllCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Cart Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is LoadingCart) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CartSuccess) {
            return _buildBody(state.cartDataModel);
          }
          return SizedBox();
        },
      ),
    );
  }

  Widget _buildBody(CartDataModel cartDataModel) {
    return ListView(
      children: [
        // products
        _listOfProducts(cartDataModel),

        // cupon
        _cuponWidget(cartDataModel),

        // reciet
        _receitWidget(cartDataModel),

        // checkout
        _checkoutButton(cartDataModel),
      ],
    );
  }

  Widget _listOfProducts(CartDataModel cartDataModel) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: cartDataModel.products.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final cartItem = cartDataModel.products[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: AppColors.borderColor),
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: ListTile(
                    leading: Image.network(
                      'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/29abad8d7ae64654b001adb90136819e_9366/RUNMAGICA_SHOES_Blue_EY2972_01_standard.jpg',
                    ),
                    title: Text(
                      cartItem.title,
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '\$ ${cartItem.price}',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_outline_outlined),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Icon(Icons.remove),
                          ),
                          Container(
                            child: Text('${cartItem.quantity}'),
                          ),
                          Container(
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _cuponWidget(CartDataModel cartDataModel) {
    return Container(
      margin: EdgeInsets.all(8),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Coupon code',
          suffixIcon: ElevatedButton(
            onPressed: () {},
            child: Text('Apply'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _receitWidget(CartDataModel cartDataModel) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColors.borderColor),
      ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          _buildReciet('items', '${cartDataModel.totalProducts}' ),
          SizedBox(height: 15),
          _buildReciet('discount total', '\$ ${cartDataModel.discountedTotal}'),
          SizedBox(height: 15),
          _buildDivider(),
          SizedBox(height: 15),
          _buildReciet('total price', '\$ ${cartDataModel.total}'),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      height: 2,
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            color: AppColors.borderColor,
            width: 8,
            margin: EdgeInsets.symmetric(horizontal: 2),
          );
        },
      ),
    );
  }

  Row _buildReciet(String title, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(data),
      ],
    );
  }

  Widget _checkoutButton(CartDataModel cartDataModel) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Check out'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
