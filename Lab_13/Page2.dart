import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text("Page 2",style: TextStyle(fontSize: 100),),
        ElevatedButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("Back"))
      ],
    )
    );
  }
}
