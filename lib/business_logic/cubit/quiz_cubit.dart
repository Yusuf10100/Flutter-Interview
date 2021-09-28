import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_interview/data/models/quiz_model.dart';
import 'package:flutter_interview/data/repository/quiz_repository.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  static QuizCubit get(context) => BlocProvider.of(context);
  final QuizRepository quizRepository;

  List<QuizModel> quizzes = [];
  QuizCubit(
    this.quizRepository,
  ) : super(QuizInitial());

  List<QuizModel> getAllQuizzes() {
    quizRepository.getAllquizzes().then((quizzes) {
      emit(QuizzesLoaded(quizzes));
      this.quizzes = quizzes;
    });
    return quizzes;
  }

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int? _correctAnswer;
  int get correctAnswer => this._correctAnswer!;

  int? _selectedAnswer;
  int get selectedAnswer => this._selectedAnswer!;

  int _questionNumber = 1;
  int get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  void checkAns(QuizModel quizModel, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = quizModel.answerIndex!;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) _numOfCorrectAns++;
    emit(NumOfCorrectAnsCalculated());
  }
}
