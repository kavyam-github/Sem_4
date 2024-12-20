import 'package:flutter/material.dart';

class Lab_6_2 extends StatelessWidget {
  const Lab_6_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Flutter Lab"),backgroundColor: Colors.red,),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.yellow ,)),
                  Expanded(child: Container(color: Colors.pink,)),
                  Expanded(child: Container(color: Colors.green,))
                ],
              ))
        ],
      ),

    );
  }
}
