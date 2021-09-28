import 'package:dio/dio.dart';
import 'package:flutter_interview/constants/constants.dart';
import 'package:flutter_interview/data/models/quiz_model.dart';

class QuizWebServices {
  late Dio dio;

  QuizWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, //60 seconds
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllquizzes() async {
    try {
      Response response = await dio.get(endPoint);
      // print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

}
