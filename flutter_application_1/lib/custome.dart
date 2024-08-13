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
  var custmername = TextEditingController();
  var focus = FocusNode();
  var contactnumber = TextEditingController();
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
      appBar: AppBar(
        title: Text("CUSTOME"),
        backgroundColor: Colors.green,
      ),
      body:ListView.builder(
        itemCount: list.length,
        itemBuilder:(context,index){
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
                      Expanded(child: Text(list[index].id.toString(),
                      style: TextStyle(color: Colors.white),)),
                      Expanded(child: Text(list[index].custmername.toString(),
                      style: TextStyle(color: Colors.white),
                      )),
                      Expanded(child: Text(list[index].contactnumber.toString(),
                      )),
                      GestureDetector(
                        onTap: () {
                          showDialog(context: context,
                           builder: (BuildContext context){
                            return AlertDialog(
                              title: Center(
                                child: Text(list[index].id.toString()),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: custmername,
                                    focusNode: focus,
                                    decoration: InputDecoration(
                                      hintText: "ennter custmorename",
                                      border: OutlineInputBorder()
                                    ),
                                  ),
                                  TextField(
                                    controller: contactnumber,
                                    focusNode: contactfocus,
                                    decoration: InputDecoration(
                                      hintText: "enter contactnumber",
                                    ),
                                  ),
                                  ElevatedButton(
                                  onPressed: (){
                                    setState(() {});
                                    if(custmername.text.toString().isEmpty){
                                      Fluttertoast.showToast(msg: "enter custmername");
                                    }else{
                                      if(contactnumber.text.toString().isEmpty){
                                        Fluttertoast.showToast(msg: "enter contactnumber");
                                      }else{
                                        var customemodel = CustomeModel(
                                          id: list[index].id,
                                          custmername: custmername.text.toString(),
                                          contactnumber:contactnumber.text.toString());
                                          databaseProvider.addCustomer(customemodel);
                                          setState(() { });
                                          getdata();
                                      }
                                      custmername.clear();
                                      contactnumber.clear();
                                      Navigator.of(context).pop();
                                    }
                                  },
                                   child: Text("add customername"))
                                ],
                              ),
                            );
                           });
                        },
                        child: Icon(Icons.edit),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          databaseProvider.deleteCustomer(list[index].id??0);
                          setState(() { });
                          getdata();
                        },
                        child: Icon(Icons.delete),
                      )
                    ],
                  )
                ],
              ),
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
                      controller:custmername ,
                      focusNode:focus ,
                      decoration:const InputDecoration(
                        hintText: "enter custmer name",
                        border: OutlineInputBorder()
                      ) ,
                    ),
                    TextField(
                      controller:contactnumber,
                      focusNode:contactfocus, 
                      decoration:const InputDecoration(
                        hintText: "enter custmer contactnumber",
                        border: OutlineInputBorder()
                      ),
                     ),
                     TextButton(onPressed: (){
                      setState(() {
                      var customemodel = CustomeModel(
                        custmername: custmername.text.toString(),
                        contactnumber: contactnumber.text.toString(),

                      ) ;
                      databaseProvider.updateCustomer(customemodel);
                      Navigator.of(context).pop();
                      print("customemodel:${CustomeModel}");
                       custmername.clear();
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