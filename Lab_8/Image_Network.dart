import 'package:flutter/material.dart';

class Img_Network extends StatelessWidget {
  const Img_Network({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Image Assest Network'),
            backgroundColor: Colors.yellowAccent),
        body: Center(
            child: Image.network("https://upload.wikimedia.org/wikipedia/commons/5/59/2022_BMW_M5_CS.jpg",fit: BoxFit.cover)
        ),
      ),
    );
  }
}
