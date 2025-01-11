import 'package:flutter/material.dart';

class Singlechildscrollview extends StatelessWidget {
  const Singlechildscrollview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.amberAccent,
            ),
            Container(
              height: 200,
              color: Colors.blueAccent,
            ),
            Container(
              height: 200,
              color: Colors.grey,
            ),
            Container(
              height: 200,
              color: Colors.green,
            ),
            Container(
              height: 200,
              color: Colors.red,
            ),
            Container(
              height: 200,
              color: Colors.cyan,
            )
          ],
        ),
      )

      );
  }
}
