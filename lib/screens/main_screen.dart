import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/model/flash_sale_model.dart';
import 'package:ecommerce_app/screens/account_screen.dart';
import 'package:ecommerce_app/screens/offers_screen.dart';
import 'package:ecommerce_app/screens/search_screen.dart';
import 'package:ecommerce_app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/category_cubit/category_cubit.dart';
import '../model/category_model.dart';
import '../model/category_repo_model.dart';
import 'cart_screen.dart';
import 'category_product_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<CategoryModel> secondListOfCategory = [
    CategoryModel(title: "Man Shirt", image: "assets/images/shirt.png"),
    CategoryModel(title: "Dress", image: "assets/images/dress.png"),
    CategoryModel(title: "Man Work Equipment", image: "assets/images/man_bag.png"),
    CategoryModel(title: "Woman Bag", image: "assets/images/woman_bag.png"),
    CategoryModel(title: "Man Shirt", image: "assets/images/shirt.png"),
  ];

  List<FlashSaleModel> listOfFlashProducts = [
    FlashSaleModel("Product One", 200, "24%", "assets/"),
    FlashSaleModel("Product Two", 200, "24%", "assets/"),
    FlashSaleModel("Product Three", 200, "24%", "assets/"),
    FlashSaleModel("Product One", 200, "24%", "assets/"),
    FlashSaleModel("Product One", 200, "24%", "assets/"),
    FlashSaleModel("Product One", 200, "24%", "assets/"),
  ];

  bool isInternetConnected = false;

  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().getAllCategories();
    // final subscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   Got a new connectivity status!
      // if (result == ConnectivityResult.none) {
      //   setState(() {
      //     isInternetConnected = false;
      //   });
      // } else {
      //   setState(() {
      //     isInternetConnected = true;
      //   });
      // }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          // Top Widget [ Search bar, favorite, notifications ].
          _topBar(),

          // slider
          _sliderWidget(),

          SizedBox(height: 10),

          // category section
          _categorySectionWidget(),

          // flash section
          _flashSaleWidget(),
        ],
      ),
    );
  }

  Column _flashSaleWidget() {
    return Column(
      children: [
        // title
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Flash Sale',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'See more',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Container(
          height: 800,
          child: GridView.builder(
            itemCount: listOfFlashProducts.length,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int i) {
              return GestureDetector(
                onTap: () {
                  print('Product Clicked');
                },
                child: Container(
                  width: 180,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xffEBF0FF),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // product image
                      Image.asset(
                        'assets/images/shose_one.png',
                        height: 120,
                      ),

                      SizedBox(height: 12),
                      // product name
                      Text(
                        listOfFlashProducts[i].name,
                        style: TextStyle(
                          color: Color(0xff223263),
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 12),

                      // product price
                      Text(
                        '\$ ${listOfFlashProducts[i].price}',
                      ),

                      SizedBox(height: 12),

                      // discount price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // last price
                          Text('\$534,33'),

                          SizedBox(height: 12),

                          // discount percentage
                          Text('${listOfFlashProducts[i].discount} Off'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
          ),
        ),
      ],
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          margin: EdgeInsets.all(12),
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search Product',
                prefixIcon: Icon(Icons.search)),
          ),
        ),
        Icon(
          Icons.favorite_border_outlined,
          size: 30,
          color: Color(0xff9098B1),
        ),
        Icon(
          Icons.notifications_none_outlined,
          size: 30,
          color: Color(0xff9098B1),
        ),
      ],
    );
  }

  Widget _sliderWidget() {
    return Container(
      child: CarouselSlider.builder(
        itemCount: 5,
        options: CarouselOptions(
          height: 220,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 10),
          enableInfiniteScroll: true,
        ),
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          if (itemIndex == 0) {
            return Container(
              child: Image.asset(
                'assets/images/$itemIndex.png',
                width: MediaQuery.of(context).size.width,
              ),
            );
          }

          return Container(
            child: Image.asset(
              'assets/images/$itemIndex.jpeg',
              width: MediaQuery.of(context).size.width,
            ),
          );
        },
      ),
    );
  }

  Widget _categorySectionWidget() {
    return Column(
      children: [
        // title
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'More Category',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            print(state);

            if(state is LoadingCategories) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is ErrorInCategory) {
              return Text('There is an error! ${state.error}');
            }
            if (state is CategorySuccess) {
              final listOfCategories = state.list;
              return Container(
                height: 100,
                child: ListView.builder(
                  itemCount: listOfCategories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CategoryProductScreen(categoryName: listOfCategories[index].name)));
                      },
                      child: Container(
                        height: 100,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  NetworkImage(listOfCategories[index].image),
                            ),
                            SizedBox(height: 10),
                            Text(
                              listOfCategories[index].name,
                              style: TextStyle(
                                color: Color(0xff9098B1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return Text('Try Again!');
          },
        ),
        // List of categories
        // FutureBuilder<List<CategoryRepoModel>>(
        //   future: CategoryRepository().getAllCategories(),
        //   builder: (
        //     BuildContext context,
        //     AsyncSnapshot<List<CategoryRepoModel>> snapshot,
        //   ) {
        //     print('my connection state : ${snapshot.connectionState}');
        //     final listOfCategories = snapshot.data;
        //
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return CircularProgressIndicator();
        //     }
        //
        //     if (snapshot.data == null || snapshot.data!.isEmpty) {
        //       return Text('List is empty!');
        //     }
        //
        //     if (snapshot.connectionState == ConnectionState.none) {
        //       return Text('No Internet Connection!');
        //     }
        //
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       return Container(
        //         height: 100,
        //         child: ListView.builder(
        //           itemCount: listOfCategories!.length,
        //           shrinkWrap: true,
        //           scrollDirection: Axis.horizontal,
        //           itemBuilder: (context, index) {
        //             return Container(
        //               height: 100,
        //               margin: EdgeInsets.symmetric(horizontal: 12),
        //               child: Column(
        //                 children: [
        //                   CircleAvatar(
        //                     radius: 31,
        //                     backgroundColor: Color(0xffEBF0FF),
        //                     child: CircleAvatar(
        //                       child: Image.network(
        //                         listOfCategories[index].image,
        //                         height: 25,
        //                         width: 25,
        //                       ),
        //                       radius: 30,
        //                       backgroundColor: Colors.white,
        //                     ),
        //                   ),
        //                   SizedBox(height: 10),
        //                   Text(
        //                     listOfCategories[index].name,
        //                     style: TextStyle(
        //                       color: Color(0xff9098B1),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             );
        //           },
        //         ),
        //       );
        //     }
        //
        //     return SizedBox();
        //   },
        // ),
      ],
    );
  }
}
