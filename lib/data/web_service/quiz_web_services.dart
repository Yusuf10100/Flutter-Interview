import 'package:dio/dio.dart';
import 'package:flutter_interview/constants/constants.dart';
import 'package:flutter_interview/data/models/quiz_model.dart';

class QuizWebServices {
  Dio? dioClient;

  QuizWebServices() {
    if (dioClient == null) {
      BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000, //60 seconds
        receiveTimeout: 20 * 1000,
      );

      dioClient = Dio(options);
    }
  }

  Future<List<dynamic>> getAllquizzes() async {
    try {
      Response response = await dioClient!.get(endPoint);
      // print(response.data.toString());
      return response.data;
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        throw Exception("Connetion Timeout Exception");
      }
      throw Exception(ex.message);
    }
  }
}
