import 'package:flutter/material.dart';

class EmailValidation extends StatefulWidget {
  const EmailValidation({super.key});

  @override
  State<EmailValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<EmailValidation> {

  final _fromKey = new GlobalKey<FormState>();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  bool isObscure = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("From Validation"),
          backgroundColor: Colors.red
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _fromKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email"),
                      suffixIcon:IconButton(onPressed: (){
                        setState(() {
                          isObscure = !isObscure;
                        });
                      }, icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility))
                  ),
                  validator: (value) {
                    if (RegExp("^[a-zA-Z0-9. _%±]+@[a-zA-Z0-9").hasMatch(value!)) {
                      return 'Invalid Email';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: passwordController,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("password"),
                      suffixIcon:IconButton(onPressed: (){
                        setState(() {
                          isObscure = !isObscure;
                        });
                      }, icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility))
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password id required';
                    } else if (value.length < 4) {
                      return 'password must be at least 6 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () {
                  if(_fromKey.currentState!.validate()){
                    print("Log in successfully");
                  }
                }, child: Text("Log in")),
              ],
            )),
      ),
    );
  }
}