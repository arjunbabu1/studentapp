import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:students/api/apiclass.dart';
import 'package:students/frgtpass.dart';
import 'package:students/sharedprf.dart';
import 'package:students/student.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

 


}

class _LoginState extends State<Login> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      elevation: 0,
        centerTitle: true,
      title: Text(
        "JEETMEET",
        style: TextStyle(
          fontWeight: FontWeight.bold)
          ,),
          ),
    body: ListView(
      children: [
        Container(
      
      child: Image(image: AssetImage("assets/images/kisspng-education-teacher-school-dyplom-5b15fe9656d814.6617778615281680863557.png")),
    ),

    Padding(
      padding: const EdgeInsets.only(left: 110,top: 30),
      child: Text("Login",style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Colors.red
      ),),
    ),

    Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,top: 30),
      child: TextField(decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "User Name"
      ),controller: usernamecontroller,),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,top: 30),
      child: TextField(decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Password"
      ),controller: passwordcontroller,),
    ),
    TextButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: ((context) => Forgetpassword() )));
    }, child: Text("Forgot your password?")),
    Padding(
      padding: const EdgeInsets.only(left: 40,right: 40),
      child: ElevatedButton(
        onPressed: (){
           loginuser();
          
         
        }, child: Text("Login",style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      ),
      ),
    )
      ],
    )
    
    );
  }
   void loginuser() async{
    final usernme = usernamecontroller.text;
    final psswrd = passwordcontroller.text;

    if(usernme.isEmpty==true){
    showErrorMessage('Please enter Email');
    }
    else if(psswrd.isEmpty==true){
      showErrorMessage('Please enter Password');
    }
    else{
          final formdata = FormData.fromMap({
            'username': usernme,
            'password': psswrd
          });
          print("$formdata");

          final result = await ApiClass().loginUserApi(formdata);
          if (result !=null){
            if(result.status == 1){
              showSuccessMessage("Login successfull");
              var token = result.message;
              print(token);
              sharedvalue(token);
            } else {
              showErrorMessage(result.message!);
            }
          }
  
    }
  }
  
  void showErrorMessage(String message){
    MotionToast.error(
      title: Text('Error',style: TextStyle(fontWeight: FontWeight.bold),),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: true,
      description: Text(message)).show(context);
  }

  void showSuccessMessage(String message){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>Student()));
      MotionToast.success(
      title: Text('Success',style: TextStyle(fontWeight: FontWeight.bold),),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: true,
     // toastDuration: Duration(milliseconds: 2),
      animationDuration: Duration(milliseconds: 5),
      description: Text(message)).show(context);
  }
  
}