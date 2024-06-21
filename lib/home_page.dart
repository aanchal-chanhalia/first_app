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
      backgroundColor: Colors.red,
      
      
      title: const Text(" discover the best product!")
      ,),
  
    body:
    
       const Row(
      
        
        
       crossAxisAlignment: CrossAxisAlignment.start,
         //mainAxisAlignment: MainAxisAlignment.start,
        children: [
        
    
           Text("DICOVER THE BEST"),
           Text("PRODUCT !"),
           TextField(
      
           // controller: name,
            decoration:InputDecoration
            
              (hintText:"serch your products",
              prefixIcon:  Icon(Icons.search),
              border: OutlineInputBorder()),
             

           ),
           
    Expanded(child: 
    CircleAvatar(radius: 20,backgroundImage: AssetImage("assets/image/download/jpg"),)
        
    ),
           CircleAvatar(radius: 20,backgroundImage: AssetImage("assets/image/download/jpg"),),
        
          
 
        ]
       ),
        
       );
      
    
  }
}