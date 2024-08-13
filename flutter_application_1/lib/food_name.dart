import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_provider.dart';
import 'package:flutter_application_1/food_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FoodName extends StatefulWidget {
  const FoodName({super.key});

  @override
  State<FoodName> createState() => _FoodNameState();
}

class _FoodNameState extends State<FoodName> {
  DatabaseProvider databaseProvider = DatabaseProvider();
  var list = <FoodModel>[];
  var FoodName = TextEditingController();
  var foodfocus = FocusNode();
  var  FoodPrice = TextEditingController();
  var Pricefocus = FocusNode();
  var getfoodname = "foodname";
  var foodnamelist = [];

    
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getdata();

  }

  void getdata()async{
    list = await databaseProvider.getlist();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FOOD name"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Text(list[index].FoodName.toString()),
                      Text(list[index].FoodPrice.toString()),
                      ElevatedButton(onPressed:(){
                        setState(() {});
                        showDialog(
                          context: context,
                           builder:(BuildContext context){
                            return AlertDialog(
                              title:Center(
                                child: Text("dailog"),
                              ) ,
                              content: Column(
                                mainAxisSize:MainAxisSize.min ,
                                children: [
                                  TextField(
                                    controller: FoodName,
                                    focusNode: foodfocus,
                                    decoration: InputDecoration(
                                      hintText: "enter foodname",
                                      border: OutlineInputBorder()
                                    ),
                                  ),
                                  TextField(
                                    controller:FoodPrice,
                                    focusNode: Pricefocus,
                                    decoration: InputDecoration(
                                      hintText: "enter foodprice",
                                      border: OutlineInputBorder()
                                    ),
                                  ),
                                  
                                ],
                              ),
                            );
                           });
                        FoodName.clear();
                        Navigator.of(context).pop();
                      },
                       child: Icon(Icons.edit)),
                       
                       GestureDetector(
                        onTap: (){
                          setState(() {});
                          databaseProvider.deleteTodo(list[index].id??0);
                          setState(() {});
                          getdata();
                        },
                        child: Icon(Icons.delete),
                       )
                       ]
              ),
            ),);
        }
        
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context,
             builder: (BuildContext context){
              return AlertDialog(
                title: Center(
                  child: Text("Dialog"),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: FoodName,
                      focusNode: foodfocus,
                      decoration: InputDecoration(
                        hintText: " Enter FoodName",
                        border: OutlineInputBorder()
                      ), 
                       ),
                       TextField(
                        controller: FoodPrice,
                        focusNode: Pricefocus,
                        decoration: InputDecoration(
                          hintText: "Enter FoodPrice",
                          border: OutlineInputBorder()
                        ),
                       ),
                       TextButton(onPressed: (){
                        setState(() {});
                        var foodmodel = FoodModel(
                          FoodName: FoodName.text.toString(),
                          FoodPrice:double.parse(FoodPrice.text)
                        );
                        databaseProvider.insertFood(foodmodel);
                        Navigator.of(context).pop();
                        print("foodmodel:${FoodModel}");
                        FoodName.clear();
                        getdata();
                       }, 
                       child: Text("add name"))
                  ],
                ),
              );
             });
          },
          child: Icon(Icons.add),
          ),
    );
  }
}