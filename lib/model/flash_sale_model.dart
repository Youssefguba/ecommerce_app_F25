import 'package:flutter/material.dart';

class FlashSaleModel {
  String name;
  double price;
  String discount;
  String image;
  String? description;
  List<String>? listOfImages;
  List<Color>? listOfColors = [ Colors.red, Colors.green ];

  FlashSaleModel(this.name, this.price, this.discount, this.image);


}