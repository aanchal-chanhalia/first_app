import 'package:flutter/material.dart';
import 'package:flutter_application_1/custome_model.dart';
import 'package:flutter_application_1/database_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Custome extends StatefulWidget {
  const Custome({super.key});

  @override
  State<Custome> createState() => _CustomeState();
}

class _CustomeState extends State<Custome> {
  DatabaseProvider databaseProvider = DatabaseProvider();
  var list = <CustomeModel>[];
  var customerName = TextEditingController();
  var focus = FocusNode();
  var contacNumber = TextEditingController();
  var contactfocus = FocusNode();
  var getcustomename = "customename";
  var  customelist = [];
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
    
    void  getdata()async{
    list =await databaseProvider.getList();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:ListView.builder(
        itemCount: list.length,
        itemBuilder:(context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              child:Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                Expanded(child:Text(list[index].id.toString(),
                style:TextStyle(color: Colors.black) ,)),
                Expanded(child: Text(list[index].customerName.toString(),
                style: TextStyle(color: Colors.black),)),
                Expanded(child: Text(list[index].contacNumber.toString(),
                style: TextStyle(color: Colors.black),)),
                GestureDetector(
                  onTap: (){
                    showDialog(context: context, 
                    builder: (BuildContext context){
                     return AlertDialog(
                      title: Center(
                        child: Text("dailog"),
                      ),
                      content:Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: customerName,
                            focusNode:focus ,
                            decoration: InputDecoration(
                              hintText: "enter customerName",
                              border: OutlineInputBorder()
                            ),
                          ),
                          TextField(
                            controller:customerName ,
                            focusNode: contactfocus,
                            decoration: InputDecoration(
                              hintText: "enter contactNumber",
                              border: OutlineInputBorder()
                            ),
                          ),
                          ElevatedButton(onPressed: (){
                            setState(() {
                            });
                            if(customerName.text.toString().isEmpty){
                              Fluttertoast.showToast(msg: "enter customerName");
                            }else if(contacNumber.text.toString().isEmpty){
                              Fluttertoast.showToast(msg: "enter contactNumber");
                            }else{
                              var customemodel = CustomeModel(
                                id: list[index].id,
                                customerName: customerName.text.toString(),
                                contacNumber: contacNumber.text.toString()
                              );
                              databaseProvider.updateCustomer(customemodel);
                              setState(() {
                              });
                              getdata();
                            }
                            customerName.clear();
                            Navigator.of(context).pop();
                            contacNumber.clear();
                            Navigator.of(context).pop();
                          },
                           child: Text("add"))
                        ],
                      ) ,
                      );
                    });
                    
                  },
                  child: Icon(Icons.edit),
                  
                ),


                     GestureDetector(
                  onTap: (){
                    databaseProvider.deleteCustomer(list[index].id??0);
                    setState(() { });
                    getdata();
                  },
                  child: Icon(Icons.delete),
                )
                  ]
                )
              ],
              )
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, 
            builder: (BuildContext content){
              return AlertDialog(
                title: Center(
                  child: Text("dailog"),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller:customerName ,
                      focusNode:focus ,
                      decoration:const InputDecoration(
                        hintText: "enter custmer name",
                        border: OutlineInputBorder()
                      ) ,
                    ),
                    TextField(
                      controller:contacNumber,
                      focusNode:contactfocus, 
                      decoration:const InputDecoration(
                        hintText: "enter custmer contactnumber",
                        border: OutlineInputBorder()
                      ),
                     ),
                     TextButton(onPressed: (){
                      setState(() {
                      var customeModel = CustomeModel(
                        customerName: customerName.text.toString(),
                        contacNumber: contacNumber.text.toString(),

                      ) ;
                      databaseProvider.insrtcustomer(customeModel);
                      Navigator.of(context).pop();
                      print("CustomeModel:${CustomeModel}");
                       customerName.clear();
                      });
                     }, 
                     child: Text("add"))
                     
                  ],
                ),
              );
            }
            );
            
          },
          child: Icon(Icons.add),
          ), 
    );
  }
}