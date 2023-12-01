import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  const Subject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(179, 255, 255, 255),
      appBar: AppBar(elevation: 0,
        centerTitle: true,
        title: Text("Subject"),
        actions: [
          Row(
            children: [
                IconButton(onPressed: (){},
                 icon: Icon(Icons.search)),
                 IconButton(onPressed: (){},
                  icon: Icon(Icons.chat_bubble_outline))
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text("Class :"),
                              Text("4A",style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Subject Code :"),
                              Text("101",style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
            padding: const EdgeInsets.only(
              top: 10,left: 10,right: 10,bottom: 10),
            child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                
                        
                        Text("Subject Name"),
                        Text("Mathematics",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),),],
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                
                       
                  Text("Teacher"),
                  Text("Anil vk,k Sharath,muhammed PK",
                  style: TextStyle(
                        fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),) 
                      ],
                      ),
                      Row(
                        children: [
                          Text("Subject Author:"),
                          Text(" Pythagoras",
                          style: TextStyle(
                            fontSize: 15,
                          fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Pass Mark:"),
                          Text(" 15",
                          style: TextStyle(
                            fontSize: 15,
                          fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Final Mark:"),
                          Text(" 50",style: TextStyle(
                          fontWeight: FontWeight.bold)),
                        ],
                      ),
                      TextButton(onPressed: (){},
                       child: Text("Note:"))
                       ],
                  ),
                ),
              ),
          )
                  ],
                );
              },),
          ),
        ],
      )
    );
  }
}
