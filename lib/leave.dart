import 'package:flutter/material.dart';
import 'package:students/assigndleave.dart';
import 'package:students/leaveapply.dart';

class Leavetab extends StatelessWidget {
  const Leavetab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
     child: Scaffold(
       appBar: AppBar(elevation: 0,
        centerTitle: true,
          title: Text("Assigned Leave"),
          actions: [IconButton(onPressed: (){},
           icon: Icon(Icons.search))],
           bottom: TabBar(tabs: [
            Tab(text: "Assigned Leave",),
            Tab(text: "Leave Applay",)
           ]),
           
        ),
        body: TabBarView(children: [
            Assndleve(),
            Leaveapply()
        ]),
     ));
  }
}