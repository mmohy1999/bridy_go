import 'package:bridy_go_user/data/models/user.dart';
import 'package:bridy_go_user/data/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthWebServer{
  late DioHelper _dioHelper;

  AuthWebServer(){
    _dioHelper= DioHelper();
  }
  Future login(User user) async {
    try{
      Response response = await _dioHelper.dio.post('/auth/login',
          data: {'email': user.email, 'password':user.password},
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ));
      return response.data;
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
  Future verify(String email,String code) async{
    try{
      Response response = await _dioHelper.dio.post('/auth/verify',
        data: {
          'email':email,
          'code':code,
        },options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),);
      return response.data;
    }catch(e){
      debugPrint(e.toString());
    }
  }
  Future register(User user) async {
    try{
    Response response = await _dioHelper.dio.post('/auth/signup',
        data: {
                'name':user.name,
                'email':user.email,
                'password':user.password,
                'phone':user.phone,
    },options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),);
    return response.data;
    }
    catch(e){
      debugPrint(e.toString());
    }
  }
  Future getUserData(String token) async{
    Response response = await _dioHelper.dio.get('/auth/user',
        options:Options(headers:{'Authorization':'Bearer $token'}));
    return response.data;
  }
  }