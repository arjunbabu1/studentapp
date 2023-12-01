import 'package:flutter/material.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50,left: 50),
          child: Text("Forgot Password",
          style: TextStyle(
            color: Colors.red,
            fontSize: 30
          ),
          ),
        ),
       Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,top: 30),
      child: TextField(decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Enter your Email"
      ),),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 50,right: 50,top: 50),
      child: ElevatedButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text("Submit",style: TextStyle(
        fontWeight: FontWeight.bold,
       
      ),
      ),
      ),
    )
      ],
    ),
    );
  }
}