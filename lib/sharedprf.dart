import 'package:shared_preferences/shared_preferences.dart';

void sharedvalue(newvalue)async{
SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
sharedPreferences.setString('token',newvalue);
getvalue();

}
String? getval;
void getvalue()async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getval = sharedPreferences.getString('token');
  print("------------$getval");

}