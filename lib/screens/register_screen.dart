import 'package:ecommerce_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscureText = true;
  bool isObscureTextTwo = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController secondPasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    // callback function
                    if (value!.length < 6) {
                      return "The name must be above 6 character";
                    }
                    // String
                    if (value.isEmpty) {
                      return "The name must be not empty!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: passwordController,
                  obscureText: isObscureText, // false
                  decoration: InputDecoration(
                    hintText: 'Enter your Password ',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      icon: isObscureText
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility), // false
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: secondPasswordController,
                  obscureText: isObscureTextTwo, // false
                  decoration: InputDecoration(
                    hintText: 'Enter your Password Again',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscureTextTwo = !isObscureTextTwo;
                        });
                      },
                      icon: isObscureTextTwo
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility), // false
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    print(nameController.text);
                    print(emailController.text);
                    print(passwordController.text);

                    // false
                    if (_formKey.currentState!.validate()) {
                      if (passwordController.text ==
                          secondPasswordController.text) {
                        // successful state
                        signIn();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Your password dont match!'),
                          backgroundColor: Colors.red,
                        ));
                      }
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    try {
      final response =
          await Dio().post("https://api.escuelajs.co/api/v1/users/", data: {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480"
      });

      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MainScreen();
      }));
    } on DioError catch (e) {
      print("This is an error : ${e.response}");
      if (e.response!.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('You should enter valid email and password!'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }
}
