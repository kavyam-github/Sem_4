import 'package:flutter/material.dart';

class Listgridsinglescroll extends StatelessWidget {
   Listgridsinglescroll({super.key});

  List<String> Cities = [
    "Ahmedabad",
    "Surat",
    "Vadodara",
    "Rajkot",
    "Bhavnagar",
    "Jamnagar",
    "Junagadh",
    "Gandhinagar",
    "Anand",
    "Nadiad",
    "Morbi",
    "Mehsana",
    "Navsari",
    "Vapi",
    "Bharuch",
    "Palanpur",
    "Porbandar",
    "Godhra",
    "Dahod",
    "Valsad"
  ];

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
                child: ListView.builder(itemCount: Cities.length,itemBuilder: (context,index){
                  return ListTile(
                    title: Center(child: Text('${index+1}. ${Cities[index]}',style: TextStyle(fontSize: 30,color: Colors.black),)),
                  );
                }
                ),
              ),
              Container(
                height: 200,
                color: Colors.red,
                child: GridView.builder(
                  itemCount: Cities.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(
                        "${index+1}. ${Cities[index]}",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black
                        ),
                        ),
                      );
                  },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    childAspectRatio: 8),
                    ),
              ),
              Container(
                height: 200,
                color: Colors.purpleAccent,
                child: GridView.builder(itemCount: Cities.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio: 5), itemBuilder: (context,index){
                  return Padding(padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70),
                        color: Colors.white38,
                      ),
                      child: Center(child: Text(Cities[index],style: TextStyle(fontSize: 20),)),
                    ),
                  );
                }),
              ),

            ],
          ),
        )

    );
  }
}
