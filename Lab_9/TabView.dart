import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_project/Lab_9/Page_1.dart';
import 'package:flutter_first_project/Lab_9/Page_2.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Center(
            child: Text("Navigator"),
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page1(),));
          },
            child: Text("Go Page1"),
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Page2()),);
          },
            child: Text("Go Page2"),
          )
        ],
      ),
    );
  }
}
