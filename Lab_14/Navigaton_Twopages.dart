import 'package:flutter/material.dart';

class NavigatonTwopages extends StatelessWidget {
  const NavigatonTwopages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation between two Pages"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=> SecondPage()),);
        },
            child: Text("Go to next page")),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pop(context);
        },
            child: Text("Back to first Page")),
      ),
    );
  }
}
