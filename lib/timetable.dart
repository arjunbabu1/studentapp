import 'package:flutter/material.dart';
import 'package:students/days/friday.dart';
import 'package:students/days/monday.dart';
import 'package:students/days/saturday.dart';
import 'package:students/days/thursday.dart';
import 'package:students/days/tuesday.dart';
import 'package:students/days/wednesday.dart';




class Timetable extends StatelessWidget {
  const Timetable({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: 6,
     child: Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(elevation: 0,
        centerTitle: true,
        title: Text("Time Table Report"),
        actions: [
          IconButton(onPressed: (){}, 
          icon: Icon(Icons.chat_bubble_outline))
        ],
        bottom: TabBar(
        isScrollable: true,
        tabs: [
        Tab(
          text: 'Monday',
        ),
        Tab(
          text: 'Tuesday',
        ),
        Tab(
          text: 'Wednesday',
        ),
        Tab(
          text: 'Thursday',
        ),
        Tab(
          text: 'Friday',
        ),
        Tab(
          text: 'Saturday',
        ),         
      ]), 
      ),
      body: TabBarView(children: [
        Monday(),
        Tuesday(),
        Wednesday(),
        Thursday(),
        Friday(),
        Saturday()
      ]),
     )
     );
     
  }
}