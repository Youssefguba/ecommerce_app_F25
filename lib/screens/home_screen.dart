import 'package:ecommerce_app/model/flash_sale_model.dart';
import 'package:ecommerce_app/screens/account_screen.dart';
import 'package:ecommerce_app/screens/main_screen.dart';
import 'package:ecommerce_app/screens/offers_screen.dart';
import 'package:ecommerce_app/screens/search_screen.dart';
import 'package:ecommerce_app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../model/category_model.dart';
import 'cart_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
// }
//
//

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  State<MainPage> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<Widget> listOfScreens = [
    MainScreen(),
    SearchScreen(),
    CartScreen(),
    OffersScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: "Offers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
      body: listOfScreens[currentIndex],
    );
  }
}
