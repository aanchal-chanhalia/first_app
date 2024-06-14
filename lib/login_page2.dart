import 'package:flutter/material.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  var userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Login Page"),),
      body:  Column(children: [
         Text("Login"),
         TextField(
          controller: userName,
         decoration: const InputDecoration(hintText: "Enter Your Email",border: OutlineInputBorder()),),

         ElevatedButton(onPressed: (){
          var name = userName.text.toString();
          print(name);

         }, child: const Text("Click")),
      ],)

    );
  }
}