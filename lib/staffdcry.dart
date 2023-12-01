import 'package:flutter/material.dart';

class StaffDirectory extends StatelessWidget {
  const StaffDirectory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        centerTitle: true,
        title: Text("Staff Directory"),
      ),
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25,right: 180,bottom: 20),
            child: Align(
              
              child: Text("Subject Teacher",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Subject"),
                          Text("Teacher")
                        ],
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(": Mathematics"),
                          Text(": K sarath,Muhammed PK,Anil V")
                        ],
                      )
                    ],
                  ),
                ),
              );
            },),
          )
        ],
      ),
    );
  }
}