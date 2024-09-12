import 'package:flutter/material.dart';
import 'package:flutter_application_1/food_name.dart';
import 'package:flutter_application_1/order_name.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  var controller = PageController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Page"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
      

      PageView(
        controller: controller,
        onPageChanged: (num){
          setState(() {
            pageIndex = num;
          });

        },
        children: [
          FoodName(),
          OrderName()
        ],


      ),
        ]
      )
    );
  }
}

