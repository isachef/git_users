import 'package:dio/dio.dart';
import 'package:tt_c/helpers/catch_exception.dart';

class ApiRequester {
  static String url = "https://api.github.com/users";

  Dio _initDio() {
    return Dio(
      BaseOptions(
          baseUrl: url,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          responseType: ResponseType.json,),
    );
  }

  Future<Response> toGet() {
    Dio dio = _initDio();

    try {
      return dio.get('');
    } catch (e) {
      print('error api :$e');
      throw CatchException.convertException(e);
    }
  }

}
