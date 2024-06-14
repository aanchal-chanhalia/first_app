import 'dart:html';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  var name =TextEditingController();
var posword=TextEditingController();
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
      
      // TextButton(onPressed:(){
      //  var nameString=name.text.toString();
      //   print("press button");
      // },
    //  child:Text("press button")),
      TextField(
        controller: posword,
        decoration:const InputDecoration(hintText: "posword"), ),
        ElevatedButton(onPressed: (){
         var names = name.text.toString();
          print(names);
          var posword1 = posword.text.toString();
          print(posword1);

        },child: const Text("elevated button")),

     


      
      ],),
    );
    
    
}
}
