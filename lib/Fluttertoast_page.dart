import 'package:flutter/material.dart';

class FlutterToastPage extends StatefulWidget {
  const FlutterToastPage({super.key});

  @override
  State<FlutterToastPage> createState() => _FlutterToastPageState();
}

class _FlutterToastPageState extends State<FlutterToastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("flutter toast page") ,
      
      ),
      body:Column(
        children: [
          Text("hello"),
          Text("hello"),
          
      
        ],
      ),
    );
  }
}
