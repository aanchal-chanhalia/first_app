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
    
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.abc),
                          Expanded(
                              child: Text(
                            list[index].id.toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                          Expanded(
                              child: Text(list[index].FoodName.toString(),
                                  style: TextStyle(color: Colors.white))),
                          Expanded(
                              child: Text(list[index].FoodPrice.toString(),
                                  style: TextStyle(color: Colors.white))),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Center(
                                        child: Text(list[index].id.toString()),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: FoodName,
                                            focusNode: foodfocus,
                                            decoration: const InputDecoration(
                                                hintText: "Enter Name",
                                                border: OutlineInputBorder()),
                                          ),
                                          TextField(
                                            controller: FoodPrice,
                                            focusNode: Pricefocus,
                                            decoration: const InputDecoration(
                                                hintText: "Enter Roll Number",
                                                border: OutlineInputBorder()),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {});
                                                if (FoodName.text
                                                    .toString()
                                                    .isEmpty) {
                                                  Fluttertoast.showToast(
                                                      msg: "Ente Food Name");
                                                } else if (FoodPrice.text
                                                    .toString()
                                                    .isEmpty) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Enter FoodPrice");
                                                } else {
                                                  var foodmodel = FoodModel(
                                                      id: list[index].id,
                                                      FoodName: FoodName.text
                                                          .toString(),
                                                      FoodPrice: double.parse(
                                                          FoodPrice.text));
                                                  databaseProvider
                                                      .updatefood(foodmodel);
                                                  setState(() {});
                                                  getdata();
                                                }

                                                FoodName.clear();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Add Name"))
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: const Icon(Icons.edit),
                          ),
                          GestureDetector(
                            onTap: () {
                            
                              databaseProvider.deleteTodo(list[index].id ?? 0);
                              setState(() {});
                              getdata();
                            },
                            child: const Icon(Icons.delete),
                          )
                        ],
                      )
                    ],
                  )),
            );
          }),
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