import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/model/category_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/product_cubit/product_cubit.dart';
import '../themes/global_scaffold_widget.dart';

class SingleProductScreen extends StatefulWidget {
  final int productId;

  const SingleProductScreen({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getSingleProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is GetProductSuccess) {
          final productData = state.productModel;
          return ScaffoldGlobalWidget(
            titleText: '',
            body: ListView(
              children: [
                _sliderWidget(productData),
                _indicatorWidget(),
                _productTitleWidget(productData),
                _ratingWidget(),
                _priceWidget(),
                _productSizeWidget(),
                _productColorWidget(),
                _productDescriptionWidget(),
              ],
            ),
          );
        }

        return ScaffoldGlobalWidget(
          body: Center(child: CircularProgressIndicator()),
          titleText: '',
        );
      },
    );
  }

  Widget _sliderWidget(ProductModel productData) {
    return Container(
      child: CarouselSlider.builder(
        itemCount: productData.images.length,
        options: CarouselOptions(
          height: 220,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 10),
          enableInfiniteScroll: true,
        ),
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return Container(
            child: Image.network(
              productData.images[itemIndex],
              width: MediaQuery.of(context).size.width,
            ),
          );
        },
      ),
    );

  }

  Widget _indicatorWidget() {
    return Container();
  }

  Widget _productTitleWidget(ProductModel productData) {
    return Text(productData.title ?? 'Dummy Product');
  }

  Widget _ratingWidget() {
    return Container();
  }

  Widget _priceWidget() {
    return Container();
  }

  Widget _productSizeWidget() {
    return Container();
  }

  Widget _productColorWidget() {
    return Container();
  }

  Widget _productDescriptionWidget() {
    return Container();
  }
}
