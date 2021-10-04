import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/constants/constants.dart';
import 'package:flutter_interview/logic/cubit/quiz_cubit.dart';
import 'package:flutter_interview/presentation/widgets/widgets.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = QuizCubit.get(context); //instance of cubit
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              myBackgroundImage(),
              Column(
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    "Your Score:",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: MyColors.kSecondaryColor),
                  ),
                  Spacer(),
                  Text(
                    "${cubit.numOfCorrectAns}/${cubit.quizzes.length}",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: MyColors.kSecondaryColor),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  myMaterialButton(
                    onPressed: () {
                      cubit.resetQuiz();
                      Navigator.of(context).pushNamed(quizScreen);
                    },
                    text: "Try Again!",
                    textStyle: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: Colors.black),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
