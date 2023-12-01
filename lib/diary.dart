import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:students/api/apiclass.dart';
import 'package:students/models/diaryupdate.dart';



class Diary extends StatefulWidget {
  const Diary({super.key});             

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {

  var jsonlist=[];
ValueNotifier<List<Diaryupdate>> diariNotifier= ValueNotifier([]);
  var dot="";
 var dote=TextEditingController();
  var date=TextEditingController();
 var note=TextEditingController();

 void initState() {
    // TODO: implement initState
    super.initState();
    datadiaries();
    dataupdate();
    }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        centerTitle: true,
        title: Text("Diary"),
        actions: [
          Row(
            children: [
              IconButton(onPressed: (){},
               icon: Icon(Icons.search)),
               IconButton(onPressed: (){}
               , icon: Icon(Icons.chat_outlined))
            ],
          )
        ],
      ),
      backgroundColor: Colors.white70,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 230),
            child: TextButton(
            onPressed: (){
              showDialog(context: context, builder: (context) => AlertDialog(
                  title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add Diaries"),
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.close))
            ],
                  ),
                  content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: TextField(
                  controller: dote,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "enter date",
                    suffixIcon: IconButton(onPressed: ()async{
                final SelectedDate=await showDatePicker(
                  context: context,
                 initialDate: DateTime(2000),
                  firstDate: DateTime(2000),
                   lastDate: DateTime(2030)
                   );
                   setState(() {
                    dot=DateFormat.MMMMd().format(SelectedDate!);
                    //  dat=DateFormat.MMMEd().format(selectedDate!);
                     dote.text=dot;
                   });
              },
               icon: Icon(Icons.date_range)
               )
                  ),
                  
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: note,
                maxLines: 15,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter note",
                  
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 0, 21, 11)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(20),
                      
                    )
                  )
                ),
                onPressed: (){
                  dataupdate();
                  Navigator.pop(context);
                }, 
              child: Text("Submit"))
            ],
                  ),
                   
                  ),);
            
            },
            child: Text('Add Diaries +',style:TextStyle(
              fontWeight: FontWeight.bold,color: Colors.black
            )),
                  ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: jsonlist.length,
              itemBuilder: (context,index){
              return
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                child: Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(alignment: Alignment.topLeft,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                        color: Colors.grey,
                      ),
                      child: Center(child: Text(index.toString(),style: TextStyle(color: Colors.white38,fontWeight: FontWeight.bold),)),
                    ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(jsonlist[index].note.toString(),style: TextStyle(
                       fontWeight: FontWeight.bold),),
                      ),
                  ],
                ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(jsonlist[index].date.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Row(
                        children: [
                          ElevatedButton(  
                            onPressed: (){},
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.orange)),
                           child: Text('Edit')),
                           SizedBox(width: 20,),
                         ElevatedButton(onPressed: (){},
                         style: ButtonStyle(
                          
                         ),
                          child: Text('Delete')) 
                        ]
                      ),
                    ),
                  ),
                  ],
                ),
                
                ),
              );
            }),
          )
        ],
      ),
    );
  }
  void dataupdate() async{
  
  final _date = date.text;
  final _note = note.text;
   
    final formdata = FormData.fromMap({
            'date': _date,
            'note': _note,
            
          });
          
          final result = await ApiClass().updateUserApi(formdata);
          print("..................$result"); 
          
    
  }
    void datadiaries()async{
  final result = await ApiClass().DiariUserApi();
  print("+++++++++$result");
  setState(() {
    
    jsonlist.addAll(result!.data!);
    print(jsonlist);
    
  });
  }



}