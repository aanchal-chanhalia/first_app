import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => __HomePStateState();
}

class __HomePStateState extends State<HomePage> {
  var name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //backgroundColor: Colors.red,
      
      
      title: const Text(" discover the best product!")
      ,),
  
    body:
      const Column(
       crossAxisAlignment: CrossAxisAlignment.start,
         //mainAxisAlignment: MainAxisAlignment.center,
        children: [
           //Text("DICOVER THE BEST"),
           //Text("PRODUCT !"),
           TextField(
           // controller: name,
            decoration: InputDecoration(hintText:"serch your products",border: OutlineInputBorder()),
          

           )
      
      
          
 
        ]
       ),
        
       );
      
    
  }
}