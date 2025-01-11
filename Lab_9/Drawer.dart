import 'package:flutter/material.dart';
import 'package:flutter_first_project/Lab_9/Page_1.dart';
import 'package:flutter_first_project/Lab_9/Page_2.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
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
