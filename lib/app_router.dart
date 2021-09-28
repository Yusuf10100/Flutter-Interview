import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/business_logic/cubit/quiz_cubit.dart';
import 'package:flutter_interview/constants/constants.dart';
import 'package:flutter_interview/data/repository/quiz_repository.dart';
import 'package:flutter_interview/presentation/screens/quiz_screen/quiz_screen.dart';
import 'package:flutter_interview/presentation/screens/welcome_screen/welcome_screen.dart';

import 'data/web_service/quiz_web_services.dart';

class AppRouter {
  late QuizRepository quizRepository;
  late QuizCubit quizCubit;
  AppRouter() {
    quizRepository = QuizRepository(QuizWebServices());
    quizCubit = QuizCubit(quizRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());

      case quizScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => quizCubit,
            child: BlocConsumer<QuizCubit, QuizState>(
              listener: (context, state) {
              },
              builder: (context, state) {
                return QuizScreen();
              },
            ),
          ),
        );
    }
  }
}
