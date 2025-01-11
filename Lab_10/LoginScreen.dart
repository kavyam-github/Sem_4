import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
   Loginscreen({super.key});

  final _Key=new GlobalKey<FormState>();
  TextEditingController userNameController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _Key,
        child: Column(
        children: [
          TextFormField(
            controller: userNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Enter UserName"),
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Enter Password"),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){

          }, child: Center())
        ],
      ),),
      ),
    );
  }
}
