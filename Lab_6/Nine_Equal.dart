import 'package:flutter/material.dart';

class Lab_6_3_1 extends StatelessWidget {
  const Lab_6_3_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Flutter Lab"),backgroundColor: Colors.yellow,),
      body: Row(
        children: [
          Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.red ,)),
                  Expanded(child: Container(color: Colors.brown,)),
                  Expanded(child: Container(color: Colors.black,))
                ],
              )),
          Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.green ,)),
                  Expanded(child: Container(color: Colors.grey,)),
                  Expanded(child: Container(color: Colors.pink,))
                ],
              )),
          Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.blue ,)),
                  Expanded(child: Container(color: Colors.pink,)),
                  Expanded(child: Container(color: Colors.orange,))
                ],
              )),
        ],
      ),

    );
  }
}
