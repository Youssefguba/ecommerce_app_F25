import 'package:dio/dio.dart';
import 'package:ecommerce_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login Screen'),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email should not be empty!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password should not be empty!';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // validate -> done
                  // send data to server -> done
                  // if true: 1. save data
                  //          2. go to home screen
                  //
                  // if false: error message
                  //
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // registeration / login ( Authentication ) ( Auth )
  void _login() async {
    try {
      // final Response response = await Dio().post(
      //   'https://api.escuelajs.co/api/v1/auth/login',
      //   data: {
      //     "email": _emailController.text,
      //     "password": _passwordController.text,
      //   },
      // );
      //
      // print('data is : ${response.data['access_token']}');
      //
      // final accessToken = response.data['access_token'];
      //
      // final prefs = await SharedPreferences.getInstance();
      //
      // await prefs.setString('access_token', accessToken);
      //
      // final access = await prefs.get('access_token');
      // print('my access token is : $access');

      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MainPage();
      }));

      // print(response);
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
