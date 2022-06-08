//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static void dioInit(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/' ,
        receiveDataWhenStatusError: true,
      )
    );
  }
  static Future<Response> dioGetData({required String path, required Map<String, dynamic> query})async{
    return await dio.get(
      path,
      queryParameters: query
    );
  }
}