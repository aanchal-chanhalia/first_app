import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context ,index){
          return Padding(
            padding: EdgeInsets.all(8.0),
            child:Container(
              color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(

                  )
                ],
              ),
            ) ,
            );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
         showDialog(
          context: context,
           builder: (BuildContext context){
            return AlertDialog(
              title: Center(
                child: Text("dialog"),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.max,
                children: [

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