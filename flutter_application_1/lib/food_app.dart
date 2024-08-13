import 'package:flutter/material.dart';
import 'package:flutter_application_1/custome.dart';
import 'package:flutter_application_1/food_name.dart';
import 'package:flutter_application_1/order_name.dart';

class FoodApp extends StatefulWidget {
  const FoodApp({super.key});

  @override
  State<FoodApp> createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  int myIndex = 0;
  var navigate =[OrderName(),FoodName(),Custome()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food App"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: navigate[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {});
          myIndex = index;
        },
        currentIndex: myIndex,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"home"),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood),label:"fastfood" ),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize_rounded),label: "customize"),
        ]),
    );
  }
}