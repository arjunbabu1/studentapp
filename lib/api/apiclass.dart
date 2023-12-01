



import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:students/models/details.dart';
import 'package:students/models/diaries.dart';
import 'package:students/models/diaryupdate.dart';
import 'package:students/models/edit.dart';

import 'package:students/models/loginmodel.dart';
import 'package:students/models/logout.dart';
import 'package:students/models/profilemodel.dart';
import 'package:students/url/url.dart';

class ApiClass {
  
  

  final dio = Dio();
  final url = URL();

  ValueNotifier<List<Diariesdata>> shopNotifier= ValueNotifier([]);

  ApiClass() {
    dio.options = BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.json,

    );
  }
  Future <logindata?> loginUserApi(FormData formData) async{
    try{
      final result = await dio.post(url.baseUrl+url.loginend,data: formData);
      return logindata.fromJson((result.data));
    }
    on DioException catch(e){
      print(e);
    }catch(e){
      print(e);
    }
  }
  Future<Profile?> profUserApi() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    var token = share.getString('token');
    final result = await dio.get(url.baseUrl + url.profileend,
        options: Options(headers: {
          'Content': 'application/json',
          'Accepts': 'application/json',
          'Authorization': 'Bearer $token '
        }));
    return Profile.fromJson(result.data); 
  }
  Future<Details?> detailsUserApi() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    var token = share.getString('token');
    final result = await dio.get(url.baseUrl + url.detailsend,
        options: Options(headers: {
          'Content': 'application/json',
          'Accepts': 'application/json',
          'Authorization': 'Bearer $token '
        }));
    return Details.fromJson(result.data); 
  }
  Future <Editdata?> editUserApi(FormData formData) async{
    try{
       SharedPreferences share = await SharedPreferences.getInstance();
    var token = share.getString('token');
      final result = await dio.post(url.editnameend,data: formData,
      options: Options(headers: {
        'Content': 'application/json',
        'Accepts': 'application/json',
          'Authorization': 'Bearer $token '
      })
      );
      return Editdata.fromJson((result.data));
    }
    on DioException catch(e){
      print(e);
    }catch(e){
      print(e);
    }
  }
  Future<Diariesdata?> DiariUserApi() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    var tok = share.getString('token');
    final result = await dio.post( url.diariesend,
        options: Options(headers: {
          'Content': 'application/json',
          'Accepts': 'application/json',
          'Authorization': 'Bearer $tok '
        }));
        print("//////*****$result");
    return Diariesdata.fromJson(result.data); 
  }
  Future <Diaryupdate?> updateUserApi(FormData formData) async{
    try{
       SharedPreferences share = await SharedPreferences.getInstance();
    var token = share.getString('token');
      final result = await dio.post(url.diaryupdateend,data: formData,
      options: Options(headers: {
        'Content': 'application/json',
        'Accepts': 'application/json',
          'Authorization': 'Bearer $token '
      })
      );
      print("000000000$result");
      return Diaryupdate.fromJson((result.data));
    }
    on DioException catch(e){
      print(e);
    }

}
Future<LogoutData?> logoutUserApi() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    var tok = share.getString('token');
    final result = await dio.get(url.baseUrl + url.logoutend,
        options: Options(headers: {
          'Content': 'application/json',
          'Accepts': 'application/json',
          'Authorization': 'Bearer $tok '
        }));
     
    return LogoutData.fromJson(result.data); 
  }


}
  





