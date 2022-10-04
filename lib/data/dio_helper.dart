import 'package:dio/dio.dart';
import '../constants/strings.dart';

class DioHelper{
  late Dio dio;

  DioHelper(){
    BaseOptions options =BaseOptions(
      baseUrl: baseURl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20000,
      receiveTimeout:20000,
    );
    dio =Dio(options);
  }

}