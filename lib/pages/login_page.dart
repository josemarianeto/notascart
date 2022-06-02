import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:notascart/pages/home_page.dart';

import '../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

Future<Object> getHttp(String name, String password) async {
  try {
    var response =
        await Dio().get('https://localhost:7236/Login?name=neto&password=244');
    print(response);
    return User.fromJson(response.data);
  } catch (e) {
    return e;
  }
}

class LoginPageState extends State<LoginPage> {
  final controllerText = TextEditingController();
  final passwordController = TextEditingController();

  Future<Object> getHttp(String name, String password) async {
    try {
      var response = await Dio()
          .get('https://localhost:7236/Login?name=$name&password=$password');
      //User.fromJson(response.data);
      return Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (e) {
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 360,
          height: 440,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueAccent.shade200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextField(
                controller: controllerText,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Login"),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Senha"),
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        getHttp(controllerText.text, passwordController.text),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade600,
                    ),
                    child: const Text("Entrar"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
