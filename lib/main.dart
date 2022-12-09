import 'package:ecommerce_app/cubits/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/category_cubit/category_cubit.dart';
import 'screens/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => ProductCubit()),
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
