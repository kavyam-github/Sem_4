
import 'package:flutter/material.dart';
import 'package:flutter_first_project/Lab_15/SQLLite_TODO.dart';

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {

  MyDataBaseDemo md = MyDataBaseDemo();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // we cannot use await and asyanc in initstate so we have to create new method and
    // call in initstate
    demo();
  }

  Future<void> demo() async {
    // we have to use Future and async because we have to use await
    await md.insertState();
    md.selectAllState();
  }

  @override
  Widget build(BuildContext context) {
    String g = "Male";



    return Scaffold(

      body: Column(
        children: [
          Center(
            child: Text(g,
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold)),
          ),

          Column(
            children: [
              ListTile(
                title: Text("Male"),
                leading: Radio(
                    value: "Male",
                    groupValue: g,
                    onChanged: (value){
                      setState(() {
                        g = value!;
                      });
                    }
                ),
              ),

              ListTile(
                title: Text("Female"),
                leading: Radio(
                    value: "Female",
                    groupValue: g,
                    onChanged: (value){
                      setState(() {
                        g = value!;
                      });
                    }
                ),
              ),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Go back!'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
