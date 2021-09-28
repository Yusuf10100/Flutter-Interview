part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizzesLoaded extends QuizState {
  final List<QuizModel> quizzes;

  QuizzesLoaded(this.quizzes);

}

class NumOfCorrectAnsCalculated extends QuizState {}
