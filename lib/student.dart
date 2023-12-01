import 'package:flutter/material.dart';
import 'package:students/api/apiclass.dart';
import 'package:students/diary.dart';
import 'package:students/leave.dart';
import 'package:students/login.dart';
import 'package:students/notice.dart';
import 'package:students/personal.dart';
import 'package:students/staffdcry.dart';
import 'package:students/subject.dart';
import 'package:students/timetable.dart';

class Student extends StatefulWidget {
   Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataProf();
  }
  String? mname;
  String? name;
  String? reg;
  String? rollnumber;
  String? dob;
  String? parent;
  String? division;
  String? parents;
  String? lparent;
 String? classname;
 String? lname;
  
  @override

  Widget build(BuildContext context) {

  final lists=['Programing Contest',
  'Parents Meeting',
  'College Day',
  'College election',
  'Arts festival'];
  final lists2=['the international collegiate programming contest is an algorithmic programming contest for college students.teams of three,representing their university. work to solve the most real-world problems,fostering collaboration,creativity,innovation,and the ability to perform under pressure. ',
  'The parents teacher meeting is an integral part of a students life. Moreover, it sheds light on what a student is doing in school. Therefore, it is the schools responsibility to arrange a parents teacher meeting. The school invites parents via a formal letter in parent-teacher meetings.',
  'College Life is one of the most remarkable and lovable times of an individuals life. Unlike School Life, College Life has a different experience, and a person needs to have this experience in his/her life.',
  'Participating in an extra-curricular activity while at university has substantial career benefits; yet graduate employers often look for something more. Assuming a more active role within the students union, or its numerous societies and sports clubs, is a good idea.',
  'the international collegiate programming contest is an algorithmic programming contest for college students.teams of three,representing their university. work to solve the most real-world problems,fostering collaboration,creativity,innovation,and the ability to perform under pressure. '];
    return Scaffold(
      appBar: AppBar(elevation: 0,
        centerTitle: true,
        title: Text("JeetMeet"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.chat_bubble_outline),
          )
        ],
        
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              // child: UserAccountsDrawerHeader(
                
              //   accountName: Text("Arjun"),
              //    accountEmail: Text("arjunbabu0022@gmail.com"),
              //    currentAccountPictureSize: Size.square(50),
              //    currentAccountPicture: CircleAvatar(
              //     backgroundImage: AssetImage("assets/images/graduated-student-in-simple-flat-personal-profile-icon-or-symbol-people-concept-illustration-vector.jpeg"),
              //    ),
              //     )
              child: Row(
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/graduated-student-in-simple-flat-personal-profile-icon-or-symbol-people-concept-illustration-vector.jpeg"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30,left: 30),
                        child: Text("Hello",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,),
                        child: Text("$name $mname $lname",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22
                        ),),
                      )
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.red
              ),
                  ),
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text("Dashboard"),
                    
                    onTap: () {
                      
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Personal"),
                    trailing: Icon(Icons.expand_more),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>Personald()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person_add_outlined),
                    title: Text("Staff Directory"),
                    trailing: Icon(Icons.expand_more),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => StaffDirectory(),));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.library_books_outlined),
                    title: Text("Subject"),
                    trailing: Icon(Icons.expand_more),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => Subject())));
                    },

                  ),
                  ListTile(
                    leading: Icon(Icons.menu_book_outlined),
                    title: Text("Diary"),
                    trailing: Icon(Icons.expand_more),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Diary()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.sick_outlined),
                    title: Text("Leave"),
                    trailing: Icon(Icons.expand_more),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Leavetab()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.timer_sharp),
                    title: Text("Time Table"),
                    trailing: Icon(Icons.expand_more),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Timetable(),));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Log out"),
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) => Login(),));
                        showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Do you want to logout ?'),
          
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'No'),
              child: const Text('No'),
            ),
             TextButton(
              onPressed: ()async {
                final result = await ApiClass().logoutUserApi();
                if(result!= null){

                  if(result.status==1){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
  
                  }
                }

           
              },
              child: const Text('YES',style: TextStyle(color: Colors.red),),
            ),
          ],
        ),
      );
                    },
                  )

          ],
        ),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          ClipRect(
            
            child: Container(
              
              height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(MediaQuery.of(context).size.width,100.0)
              ),color: Colors.red
            ),
            child: Stack(
              children: [
                
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50,
                    left: 20,right: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Text("$name $mname $lname",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25
                            ),
                            ),
                          ),
                          Text('Reg no:$reg'),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('class:$classname '),
                                Text('Divition:$division')
                              ],
                            ),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('RollNo: $rollnumber'),
                                Text('DOB: $dob')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
               Positioned(
                
                left: 130,
                child: 
               CircleAvatar(radius: 50,
               backgroundImage: AssetImage("assets/images/graduated-student-in-simple-flat-personal-profile-icon-or-symbol-people-concept-illustration-vector.jpeg"),
               ),
               
               ) ,
               Positioned(
                left: 140,
                top: 260,
                child: 
               CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  "assets/images/team.png"
                  ,),
               )
               ),
               Positioned(
                top: 350,
                left: 130,
                child: 
               Column(
                children: [
                  Text("$parents $lparent",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),),
                  Text("Parent",style: TextStyle(
                    color: Colors.white,
                    
                  ),)
                ],
               ))
                
          
              ],
              
            ),
            
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
            child: Container(
              height: 850,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 223, 216, 216)
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30,top: 25),
                        child: Icon(Icons.notifications_active,
                        color: Colors.amber,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30,left: 20),
                        child: Text("Notice"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                       height: 800,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context,index)=>
                            InkWell(
                              onTap: () => Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context)=>Notice(
                                    
                                  ))),
                                child: ListTile(
                                  title: Text(lists[index],style: TextStyle(fontWeight: FontWeight.bold),),
                                  subtitle: Text(lists2[index]),
                                  trailing: Icon(Icons.arrow_forward,),
                                ),
                            ),
                             separatorBuilder: (context,index)=>
                             Divider(), 
                             itemCount: 5),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
         
        ],
      ),
      
    );
    
  }

  void dataProf() async{
 final result =  await ApiClass().profUserApi();
 
 setState(() {
    name = result!.data[0].firstName;
      reg = result.data[0].regNumber;
      rollnumber = result.data[0].rollNumber.toString();
       print("66666666$rollnumber");
      dob = result.data[0].dob;
      parent = result.data[0].parent.toString();
      division = result.data[0].divisions.name;
      parents = result.data[0].parents.firstName;
      lparent = result.data[0].parents.lastName;
      classname = result.data[0].classname.name;
       mname = result.data[0].middleName;
       lname = result.data[0].lastName;


     
 }
 );
}
 
}