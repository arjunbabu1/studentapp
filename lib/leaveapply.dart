import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Leaveapply extends StatefulWidget {
  const Leaveapply({super.key});

  @override
  State<Leaveapply> createState() => _LeaveapplyState();
}

class _LeaveapplyState extends State<Leaveapply> {
  String dropdownValue = 'annual';
var daat="";
 var datee=TextEditingController();
 var dat="";
 var date=TextEditingController();
  var tim="";
  var timenow= TimeOfDay.now();
  var time=TextEditingController();
  var tiim="";
  var timeenow= TimeOfDay.now();
  var tiime=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 235, 232, 232),
      
      body: Column(
        children: [
         Expanded(
           child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context,index){
            return  Padding(
              padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: Text('Date: 25-12-2023',
                style: TextStyle(color: Colors.black45),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,right: 55,bottom: 20),
                child: Text('status',
                style: TextStyle(color: Colors.black45),),
              )
            ],
          ),
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      
                      color: Colors.white
                    ),
                    child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text("Applicant Name"),
                            Text("Arjun",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),)],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15,top: 50),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text("Schedule"),
                            Text("Thu-Apr-2021",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),)],
                            ),
                          ),
                         
                         
                        ],
                      ),
              
                      SizedBox(width: 30,),
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 50,top: 5),
                        child: Column(
                        
                          children: [
                            
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Category"),
                                Text("Casul",
                                style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold)
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 55,right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Days"),
                                  Text("1",
                                  style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  
                   Padding(
                            padding: const EdgeInsets.only(left: 15,top: 30),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text("Reason "),
                            Text("Api testing",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),)],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15,top: 40),
                            child: Column(
                              children: [Text("Attachment"),
                            SizedBox(
                              height: 30,
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: ElevatedButton(onPressed: (){},
                                 child: Text("data"),
                                 style: ElevatedButton.styleFrom(
                                        primary: Colors.grey
                                       )),
                              ),
                            ),
                            
                            ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Divider(thickness: 3,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                            
                              children: [
                                ElevatedButton(onPressed: (){},
                                 child: Text("Edit"),
                                 style: ElevatedButton.styleFrom(
                              primary: Colors.orange
                             )),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 10),
                                   child: ElevatedButton(onPressed: (){},
                                    child: Text("Delete")),
                                 )
                              ],
                            ),
                          )
              
                ],
              ),
                    
                  ),
                ],
              ),
            );
           }),
         ),
         InkWell(
              onTap: () {
                showDialog(context: context, builder: (context) => AlertDialog(
            title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Leave Application"),
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.close))
              ],
            ),
            content: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Annual",
                    suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.expand_more))
                  ),
                  
                ),
                SizedBox(height: 10,),
                TextField(
              controller: date,
              decoration: InputDecoration(
              labelText: "Starting date",
              border: OutlineInputBorder(),
              suffixIcon: IconButton(onPressed: ()async{
                final selectedDate=await showDatePicker(
                  context: context,
                 initialDate: DateTime(2000),
                  firstDate: DateTime(2000),
                   lastDate: DateTime(2030)
                   );
                   setState(() {
                    dat=DateFormat.MMMMd().format(selectedDate!);
                    //  dat=DateFormat.MMMEd().format(selectedDate!);
                     date.text=dat;
                   });
              },
               icon: Icon(Icons.date_range)
               )
            ),),
                SizedBox(height: 10,),
                TextField(
                controller: time,
                decoration: InputDecoration(
                  labelText: "Starting time",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: ()async{
                    final selectedTime=await showTimePicker(
                      context: context,
                     initialTime: TimeOfDay.now());
                     if(selectedTime != null&&selectedTime != timenow){
                     setState(() {
                      time.text=selectedTime.format(context);
                   
                     }
                     );
                    
                     }
                  },
                   icon: Icon(Icons.watch))
                  
                ),
              ),
                SizedBox(height: 10,),
                TextField(
              controller: datee,
              decoration: InputDecoration(
              labelText: "End date",
              border: OutlineInputBorder(),
              suffixIcon: IconButton(onPressed: ()async{
                final selectedDate=await showDatePicker(
                  context: context,
                 initialDate: DateTime(2000),
                  firstDate: DateTime(2000),
                   lastDate: DateTime(2030)
                   );
                   setState(() {
                    daat=DateFormat.MMMMd().format(selectedDate!);
                    //  dat=DateFormat.MMMEd().format(selectedDate!);
                     datee.text=daat;
                   });
              },
               icon: Icon(Icons.date_range)
               )
            ),),
                SizedBox(height: 10,),
                TextField(
                controller: tiime,
                decoration: InputDecoration(
                  labelText: "End time",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: ()async{
                    final selectedTime=await showTimePicker(
                      context: context,
                     initialTime: TimeOfDay.now());
                     if(selectedTime != null&&selectedTime != timeenow){
                     setState(() {
                      tiime.text=selectedTime.format(context);
                   
                     }
                     );
                    
                     }
                  },
                   icon: Icon(Icons.watch))
                  
                ),
              ),
                SizedBox(height: 10,),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Reason",
                    
                    
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Attachment",
                    suffixIcon: Icon(Icons.attachment)
                    
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  style: ButtonStyle(
                    
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(10),
                        
                      )
                    )
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                child: Text("Submit"))
              ],
            ),
           
          ),);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 25,right: 20,bottom: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(child: Text("Add a Leave Application")),
                  
                ),
              ),
            )
        ],
      )
      );

    
  }
}