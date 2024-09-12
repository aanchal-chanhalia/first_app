import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/custome_model.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {

  var list = <CustomeModel>[];
  String? name;
  DateTime selectedDate =DateTime.now();
  String selectDate = "Select date";
  DatePickerDateOrder datePickerDateOrder = DatePickerDateOrder.dmy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
       DropdownButton( 
                
              // Initial Value 
              value: name, 
                
              // Down Arrow Icon 
              icon: const Icon(Icons.keyboard_arrow_down),     
                
              // Array list of items 
              items: list.map((CustomeModel items) { 
                return DropdownMenuItem<CustomeModel>( 
                  value: items, 
                  child: Text(items.customerName!), 
                ); 
              }).toList(), 
              // After selecting the desired option,it will 
              // change button value to selected value 
              onChanged: ( newValue) {  
                setState(() { 
               //   name = newValuec; 
                }); 
              },
              
            ), 
            ElevatedButton(onPressed: (){
              setState(() {
                
              });
              _selectdate(context);

            }, child: Text(selectDate == null ?"SelectDate ":selectDate)),

            ElevatedButton(onPressed: (){
              setState(() {
              });
              ListView.builder(
                itemCount: list.length,
                itemBuilder: (context,index){
                  Padding(padding:const EdgeInsets.all(8.0))
                });
            },
            child: child)
        
            
            
        ],
    )
    );
  }
              void _selectdate(BuildContext context) async{
              print("in data picker");
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                 firstDate: DateTime.now(),
                  lastDate: DateTime(2010));
                  if(picked!= null && picked != selectDate){
                    setState(() {
                      selectedDate = picked;
                       print("seleced Date $picked");
                       selectDate =datePickerDateOrder.DateTime;
                      });
                  }
            }
}