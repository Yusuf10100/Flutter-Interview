import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_interview/app_router.dart';

import 'logic/bloc_observer.dart';
import 'logic/cubit/quiz_cubit.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //make sure initializing everything before running the app
  Bloc.observer = MyBlocObserver();
 

  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuizCubit>(
      create: (context) => QuizCubit(
        AppRouter().quizRepository,
      )
        ..getAllQuizzes()..onInit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
