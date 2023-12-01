import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  String? listspass;
  String? lists2pass;
   Notice({super.key});

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
      elevation: 0,
        centerTitle: true,
      title: Text("Notice"),
      
    ),
    
      body:Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
        child: Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color.fromARGB(255, 223, 222, 222)
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text("Title",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15,),
                child: Text("Programming Contest",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                child: Container(
                  width: 400,
                  height: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text("Description",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Text("The international collegiate programming contest is an algorithmic programming contest for college students.teams of three,representing their university. work to solve the most real-world problems,fostering collaboration,creativity,innovation,and the ability to perform under pressure."),
              )
            ],
          ),
        ),
      ) ,
    );
  }
}