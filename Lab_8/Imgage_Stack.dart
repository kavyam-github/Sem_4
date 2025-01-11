import 'package:flutter/material.dart';

class Img_Stack extends StatelessWidget {
  const Img_Stack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Image Stack'),
            backgroundColor: Colors.yellowAccent),
              body: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(child: Image.asset("Assets/Imgs/img.png",fit: BoxFit.cover,), height: 200,width: 400,),
                  Positioned(bottom: 100,child: Text("Drive Free!!",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.greenAccent),))
                ],
              )
          ),
        ),
    );
  }
}
