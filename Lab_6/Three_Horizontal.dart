import 'package:flutter/material.dart';

class Lab_6_1 extends StatelessWidget {
  const Lab_6_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Flutter Lab"),backgroundColor: Colors.red,),
      body: Row(
        children: [
          Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.yellow ,)),
                  Expanded(child: Container(color: Colors.red,)),
                  Expanded(child: Container(color: Colors.green,))
                ],
              ))
        ],
      ),

    );
  }
}
