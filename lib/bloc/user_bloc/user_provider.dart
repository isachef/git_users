import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tt_c/helpers/api_requester.dart';
import 'package:tt_c/helpers/catch_exception.dart';
import 'package:tt_c/models/user_model.dart';

class UserProvider {
  ApiRequester _apiRequester=ApiRequester();
   getUsers()async{
    Response response=await _apiRequester.toGet();
    try{
    if(response.statusCode==200){

      List<User> users= response.data.map<User>((el)=>User.fromJson(el)).toList();

      return users;
    }
    else{

      throw CatchException.convertException(response.statusCode);
    }

    }catch(e){
      CatchException.convertException(e);
    }
  }
}