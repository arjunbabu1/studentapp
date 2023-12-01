import 'dart:async';

import 'package:flutter/material.dart';
import 'package:students/login.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: Screens(),theme: ThemeData(
      primarySwatch: Colors.red
    ),debugShowCheckedModeBanner: false,);
  }
}
class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () 
     => Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context)=>Login()))
    );
  }
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image(image: AssetImage("assets/images/kisspng-distance-education-teacher-school-training-download-education-icon-5ab13464b4e105.6765825515215627247409.png"),fit: BoxFit.fitWidth,),
    );
  }
}