import 'dart:html';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => __HomePStateState();
}

class __HomePStateState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.yellow,

      title: Text("Hello Anchal"),),
  
    body:
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text("Hello Anchal"),
      Text("Hello Rahul"),
      Text("Hello Rahul"),
      Text("Hello Rahul"),
      Text("Hello Rahul"),
      Row(
  
        children: [
           Text("Hello Anchal"),
      Text("Hello Rahul"),
      Text("Hello Rahul"),
      Text("Hello Rahul"),
      Text("Hello Rahul"),
        ]
       ),
        ],
       ) 
      );
    
  }
}