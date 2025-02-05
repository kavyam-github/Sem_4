import 'package:flutter/material.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Home.dart';


class Navigationclick extends StatefulWidget {
  const Navigationclick({super.key});

  @override
  State<Navigationclick> createState() => _Navigationclick();
}

class _Navigationclick extends State<Navigationclick> {
  int idx=0;
  @override
  Widget build(BuildContext context) {
    List<Widget> list=[
      Home(),Page1(),Page2(),
    ];
    return Scaffold(
        body: list[idx],
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: idx,
        onTap: (value) {
          setState(() {
            idx=value;
          });
        }, items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label:"Page1"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit_sharp),label:"Page2"),
    ],
    ),

        );

  }
}
