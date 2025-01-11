import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Hello Wold from Page1",
              style: TextStyle(
                  fontSize: 100,
                  color: Colors.brown,
                  backgroundColor: Colors.yellow
              ),),
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop(MaterialPageRoute(builder: (context) => Navigator(),));
          },
            child: Text("Go Home"),
          )
        ],
      ),
    );
  }
}
