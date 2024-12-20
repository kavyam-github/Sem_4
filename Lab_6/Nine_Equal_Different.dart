import 'package:flutter/material.dart';

class Lab_6_3_2 extends StatelessWidget {
  const Lab_6_3_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Flutter Lab"),backgroundColor: Colors.yellow,),
      body: Row(
        children: [
          Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.grey ,)),
                  Expanded(child: Container(color: Colors.orange,)),
                  Expanded(child: Container(color: Colors.blueAccent))
                ],
              )),
          Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.brown,),flex: 8,),
                  Expanded(child: Container(color: Colors.grey,),flex: 5,),
                  Expanded(child: Container(color: Colors.blueGrey,),flex: 2,)
                ],
              )),
          Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.redAccent,),flex: 2,),
                  Expanded(child: Container(color: Colors.yellow,),flex: 8,),
                  Expanded(child: Container(color: Colors.purpleAccent,),flex: 5,)
                ],
              )),
        ],
      ),

    );
  }
}
