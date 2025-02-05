import 'package:flutter/material.dart';

import 'Page1.dart';
import 'Page2.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Home"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page1(),));
              },
            ),
            ListTile(
              title: Text("About"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2(),));
              },
            )
          ],
        ),
      ),
    );
  }
}
