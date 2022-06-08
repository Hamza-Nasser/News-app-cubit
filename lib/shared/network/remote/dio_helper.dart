//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
//https://ap.api.riotgames.com/val/status/v1/platform-data?api_key=RGAPI-4a510736-de64-409f-a1e5-deb111d7bf27
import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static void dioInit(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/' ,
        //baseUrl: 'https://ap.api.riotgames.com',
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