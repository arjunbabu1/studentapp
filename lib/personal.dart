import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:students/api/apiclass.dart';


class Personald extends StatefulWidget {
  const Personald({super.key});

  @override
  State<Personald> createState() => _PersonaldState();
}

class _PersonaldState extends State<Personald> {
   File? _profileImage;
Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }
   void initState() {
    // TODO: implement initState
    super.initState();
    datadetail();
   
  }
 String? name;
  String? mname;
  String? lname;
  String? gender;
  String? reg;
  String? parents;
  String? lparents;
  String? classname;
  int? division;
  int? rollNumber;
  String? dob;
  String? phone;
  String? email;
  String? phone2;
  String? address;
  String? place;
  String? post;
  String? blood;
  int? state;
  int? country;

final firstnamecontroller = TextEditingController();
  final secondnamecontroller = TextEditingController();
    final thirdnamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 225, 225),
      body: ListView(
        children: [
          Stack(children: [
            Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        )),
                  ),
                ),
                height: 150,
                width: double.infinity,
                color: Colors.red),

  Padding(
    padding: const EdgeInsets.only(top: 80),
    child: Align(alignment: Alignment.bottomCenter,
      child: GestureDetector(
                  onTap: _pickProfileImage,
                  child: _profileImage == null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey,
                         backgroundImage: AssetImage('assets/images/graduated-student-in-simple-flat-personal-profile-icon-or-symbol-people-concept-illustration-vector.jpeg'),
                        )
                      : CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(_profileImage!),
                        ),
                ),
    ),
  ),
            Padding(
              padding: const EdgeInsets.only(top: 170,left: 110),
              child: Align(alignment: 
              Alignment.bottomCenter,
                child: IconButton(splashColor: Colors.red,
                  onPressed: _pickProfileImage,
                  tooltip: 'Pick Profile Picture',
                  icon: Icon(Icons.add_a_photo),
                ),
              ),
            ),

          ]),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$name $mname $lname",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: IconButton(onPressed: (){
                          showModalBottomSheet(context: context,
                          backgroundColor: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                           builder: (BuildContext context)
                          {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 20),
                                  child: TextField(
                                    controller: firstnamecontroller,
                                    decoration: InputDecoration(
                                      labelText: "First Name",
                                      border: OutlineInputBorder(
                                        
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 20),
                                  child: TextField(
                                    controller: secondnamecontroller,
                                    decoration: InputDecoration(
                                      labelText: "Middle Name",
                                      border: OutlineInputBorder(
                                        
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 20),
                                  child: TextField(
                                    controller: thirdnamecontroller,
                                    decoration: InputDecoration(
                                      labelText: "Last Name",
                                      border: OutlineInputBorder(
                                        
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,width: 300,
                                  child: ElevatedButton(onPressed: (){
                                    dataedit();
                                    Navigator.pop(context);
                                  },
                                   child: Text("Save")
                                   ),
                                )
                              ],
                            );
                          });
                        },
                         icon: Icon(Icons.edit)),
                      )
                    ],
                  ),
                ),
                Text('Reg No:$reg'),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                              radius: 25,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/team.png'),
                                radius: 23,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 13, top: 13),
                            child: Column(
                              children: [
                                Text(
                                  '$parents $lparents',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 2, right: 27),
                                  child: Text('Parent'),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Gender'),
                            Text('Class'),
                            Text('Division'),
                            Text('Roll No'),
                            Text('DOB'),
                            Text('Phone')
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(': $gender'),
                            Text(': $classname'.toString()),
                            Text(': $division'),
                            Text(': $rollNumber'),
                            Text(': $dob'),
                            Text(': $phone')
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email'),
                      Text('Secondary Phone'),
                      Text('Address'),
                      Text('Place'),
                      Text('Post Code'),
                      Text('Blood Group'),
                      Text('State'),
                      Text('Country')
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(': $email'),
                      Text(': $phone2'),
                      Text(': '),
                      Text(': $place'),
                      Text(': $post'),
                      Text(': $blood'),
                      Text(': $state'),
                      Text(': $country')
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
    
  }
  void dataedit() async{
    final firstname = firstnamecontroller.text;
    final middlename = secondnamecontroller.text;
    final lastname = thirdnamecontroller.text;

    if(firstname.isEmpty==true){
    showErrorMessage('Please enter Firstname');
    }
    else if(middlename.isEmpty==true){
      showErrorMessage('Please enter Middlename');
    }
    else if(lastname.isEmpty==true){
      showErrorMessage('Please enter Lastname');
    }
    else{
          final formdata = FormData.fromMap({
            'first_name': firstname,
            'middle_name': middlename,
            'last_name': lastname
          });
          print("$formdata");

          final result = await ApiClass().editUserApi(formdata);
          if (result !=null){
            if(result.status == 1){
              showSuccessMessage("Edit Sucessfull");

          
            } else {
              showErrorMessage("sucessfull");
            }
          }

    }
  }
  void showErrorMessage(String message){
    MotionToast.error(
      title: Text('Error',style: TextStyle(fontWeight: FontWeight.bold),),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: true,
      description: Text(message)).show(context);
  }

  void showSuccessMessage(String message){
    
      MotionToast.success(
      title: Text('Success',style: TextStyle(fontWeight: FontWeight.bold),),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: true,
    
      animationDuration: Duration(milliseconds: 5),
      description: Text(message)).show(context);
  }

   void datadetail() async {
  final result = await ApiClass().detailsUserApi();
  setState(() {
    name = result?.data.firstName;
    mname = result?.data.middleName;
    lname = result?.data.lastName;
    gender = result?.data.gender;
    reg = result?.data.regNumber;
    parents = result?.data.parents.firstName;
    lparents = result?.data.parents.lastName;
    classname = result?.data.classname.toString();
    division = result?.data.division;
    rollNumber = result?.data.rollNumber;
    dob = result?.data.dob;
    phone=result?.data.phone;
    email=result?.data.email;
    phone2=result?.data.phone2;
    address=result?.data.address;
    place=result?.data.place;
    post=result?.data.code;
    blood=result?.data.blood;
    state = result?.data.state;
    country = result?.data.country;
  });
 }

  Future<void> _pickProfileImage() async {
    showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 200,
                                child: Column(
                                  children: [
                                    Container(
                                        color: Colors.red,
                                        height: 40,
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        child: Text('Choose Source')),
                                        SizedBox(height: 30,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            CircleAvatar(
                                                radius: 30,
                                                backgroundColor: Colors.red,
                                                child: IconButton.outlined(
                                                  onPressed: () {
                                                  _getImage(ImageSource.camera);
                                                  },
                                                  icon: Icon(
                                                      Icons.photo_camera),
                                                  color: Colors.white,
                                                )),
                                                Text('Camera')
                                          ],
                                        ),
                                      
                                 
                                    
                                        Column(
                                          children: [
                                            CircleAvatar(
                                                radius: 30,
                                                backgroundColor: Colors.red,
                                                child: IconButton.outlined(
                                                  onPressed: () { _getImage(ImageSource.gallery);
                                                  Navigator.pop(context);},
                                                  icon: Icon(
                                                      Icons.photo_album),
                                                  color: Colors.white,
                                                )),
                                                Text('Gallery')
                                          ],
                                        )]
                                      )
                                 ],
                                    
                                  
                            ),
                        );
                  }
            );
      }
 
}