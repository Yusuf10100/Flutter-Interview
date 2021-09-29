import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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

  void onInit() {
    _pageController = PageController();
  }

  PageController _pageController = PageController();
  PageController get pageController => this._pageController;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int? _correctAnswer;
  int get correctAnswer => this._correctAnswer!;

  int? _selectedAnswer;
  int get selectedAnswer => this._selectedAnswer!;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  int? questionNumber = 1;

  void checkAns(QuizModel quizModel, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = quizModel.answerIndex!;
    _selectedAnswer = selectedIndex;
    questionNumber = int.tryParse(quizModel
        .questionId!); //because id in the database is a number with String data type
    print("question number is $questionNumber");

    if (_correctAnswer == _selectedAnswer) _numOfCorrectAns++;

    Future.delayed(Duration(seconds: 2), () {
      return nextQuestion();
    });
  }

  void nextQuestion() {
    if ((questionNumber!) != quizzes.length) {
      _isAnswered = false;
      _pageController.nextPage(
        duration: Duration(microseconds: 250),
        curve: Curves.ease,
      );
    }
  }

  void updateTheQuestionNumber(int index) {
    questionNumber = index + 1;
  }
}
