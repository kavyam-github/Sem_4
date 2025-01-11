import 'package:flutter/material.dart';
import 'package:flutter_first_project/Lab_9/Page_1.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Center(
            child: Text("Hello Wold from Page2",
              style: TextStyle(
                  fontSize: 100,
                  color: Colors.brown,
                  backgroundColor: Colors.yellow
              ),),
          )
        ],
      ),
    );
  }
}
