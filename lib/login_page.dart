import 'dart:html';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  var name =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(
      backgroundColor: Colors.yellow,
    title :const Text("login page"),
    ),
     body:  Column(children: [
      const Center(child: Text("login"),),
     TextField(
      controller: name,
      decoration: InputDecoration(hintText: "Enter Your Email"),),
      
      TextButton(onPressed:(){
        nameString=name.text.toString();
        print("press button");
      },
      child:Text("press button")),
    ElevatedButton(onPressed: (){},
     child: const Text("elevated button")),
OutlinedButton(onPressed: (){},
 child:Text("outline button")),
      Text(nameString,
      style:const TextStyle(color:Colors.blue ) ,),

      
      ],),
    );
    
    
}
}
