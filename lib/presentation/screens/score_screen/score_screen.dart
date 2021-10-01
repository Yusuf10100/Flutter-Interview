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
        var cubit = QuizCubit.get(context);
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
                  SizedBox(height: 30,),
                 
                   MaterialButton(
                    onPressed: () {
cubit.resetQuiz();
                      Navigator.of(context).pushNamed(quizScreen);                    },
                    child: Container(
                      width: 200,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: MyColors.kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                      "Try Again",
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: Colors.black),
                      ),
                    ),
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
