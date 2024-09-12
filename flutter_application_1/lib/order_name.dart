import 'package:flutter/material.dart';
import 'package:flutter_application_1/order_detail_screen.dart';

class OrderName extends StatefulWidget {
  const OrderName({super.key});

  @override
  State<OrderName> createState() => _OrderNameState();
}

class _OrderNameState extends State<OrderName> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    
    floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OrderDetailScreen()));


    }, child: Icon(Icons.add),),
      
    );
  }
}