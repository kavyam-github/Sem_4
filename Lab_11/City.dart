import 'package:flutter/material.dart';

class City extends StatelessWidget {
  City({super.key});
  List<String> cities=[
        'Rajkot',
        'Surat',
        'Amrei',
        'Gunagadh',
        'Ahmedabad',
        'Jamnagar',
        'Morbi'
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("List of Cities in List View"),backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (BuildContext context,int index) {
            return Card(child: ListTile(title: Text(cities[index]),),);
    }
    ));
  }
}
