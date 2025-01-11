import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  const Img({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(title: const Text('Image Assest'),
      backgroundColor: Colors.yellowAccent),
      body: Center(
        child: Image.asset("Assets/Imgs/img.png",fit: BoxFit.cover)
        ),
        ),
    );
  }
}
