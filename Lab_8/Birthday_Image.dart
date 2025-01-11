import 'package:flutter/material.dart';

class Birthday_Image extends StatelessWidget {
  const Birthday_Image({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Birthday Image"),
          backgroundColor: Colors.yellow,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset("Assets/Imgs/img_3.png",fit: BoxFit.cover),
            Center(
                child: Text("Happy Birthday to me!!",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.greenAccent),)),

          ],
        ),
      ),
    );
  }
}
// TODO Implement this library.