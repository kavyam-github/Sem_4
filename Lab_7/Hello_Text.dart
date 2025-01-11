import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello Worldd"),),
          body: Center(
          child: Text("Hello Wold",
          style: TextStyle(
            fontSize: 100,
            color: Colors.brown,
            backgroundColor: Colors.yellow
          ),)

    ));
  }
}
