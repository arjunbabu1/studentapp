import 'package:flutter/material.dart';


class Assndleve extends StatefulWidget {
  const Assndleve({super.key});

  @override
  State<Assndleve> createState() => _AssndleveState();
}

class _AssndleveState extends State<Assndleve> {

  final list = ['X-mas','Onam','Perunaal','Marrage'];
  final list2 = ['2 Days','10 Days','1 Days','2 Days'];

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.black12,
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10,),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(list[index]),
                Text(list2[index])
              ],
            ),
          ),
        );
      },),
    );
  }

  
}