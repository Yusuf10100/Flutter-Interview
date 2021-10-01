import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/constants/constants.dart';
import 'package:flutter_interview/logic/navigation_service/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import 'package:flutter_interview/data/models/quiz_model.dart';
import 'package:flutter_interview/data/repository/quiz_repository.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  static QuizCubit get(context) => BlocProvider.of(context);
  final QuizRepository quizRepository;
  final NavigationService _navigationService = locator<NavigationService>();

  List<QuizModel> quizzes = [];
  QuizCubit(
    this.quizRepository,
  ) : super(QuizInitial());

  List<QuizModel> getAllQuizzes() {
    quizRepository.getAllquizzes().then((quizzes) {
      emit(QuizzesLoaded(quizzes));
      this.quizzes = quizzes;
    }, onError: (exception) {
      if (exception.message != null) {
        _navigationService.showMyDialog("Oops, Server Lost Connection!");
      }
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

    if (_correctAnswer == _selectedAnswer) _numOfCorrectAns++;

    Future.delayed(Duration(seconds: 1), () {
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
    } else {
      _navigationService.navigateTo(scoreScreen);
    }
  }

  void updateTheQuestionNumber(int index) {
    questionNumber = index + 1;
  }

  void resetQuiz() {
    _isAnswered = false;
    questionNumber = 1;
    _numOfCorrectAns = 0;
  }
}
