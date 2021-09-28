import 'package:flutter_interview/data/models/quiz_model.dart';
import 'package:flutter_interview/data/web_service/quiz_web_services.dart';

class QuizRepository {
  final QuizWebServices quizWebServices;

  QuizRepository(this.quizWebServices);

  Future<List<QuizModel>> getAllquizzes() async {
    final quizzes = await quizWebServices.getAllquizzes();
    return quizzes.map((quiz) => QuizModel.fromJson(quiz)).toList();
  }
}
