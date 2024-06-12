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
      backgroundColor: Colors.red,
      
      
      title: Center( 
        child: Text("strawberry pavlova")
      )
      ,),
  
    body:
      const Column(
       // crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text("strawberry pavlova"),
           Text("pavlova is a meringue-basde desert"),
      Text("named after the russian"),
      Text("ballerina Anua pavlova"),
      Text("fealtures acrips crust and soft,light inside"),
      Text("topped with fruit and whipped cream."),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
  
        children: [
          
           Text("****  170 Reviews"),
 
        ]
       ),
        ],
       ) 
      );
    
  }
}