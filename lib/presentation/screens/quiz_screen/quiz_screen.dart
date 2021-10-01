import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/constants/constants.dart';
import 'package:flutter_interview/data/models/quiz_model.dart';
import 'package:flutter_interview/data/repository/quiz_repository.dart';
import 'package:flutter_interview/logic/cubit/quiz_cubit.dart';
import 'package:flutter_interview/presentation/widgets/widgets.dart';

import 'components/question_card.dart';

class QuizScreen extends StatelessWidget {
  late List<QuizModel> allQuizzes;
  late QuizRepository quizRepository;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = QuizCubit.get(context);
        cubit.getAllQuizzes();
        cubit.onInit();
        if (state is QuizzesLoaded) {
          allQuizzes = (state).quizzes;
          return Scaffold(
            body: Stack(
              children: [
                myBackgroundImage(),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: Align(
                    child: MaterialButton(
                      onPressed: () {
                        cubit.nextQuestion();
                         if (cubit.questionNumber == cubit.quizzes.length)
                        Navigator.of(context).pushNamed(scoreScreen);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    alignment: Alignment.topRight,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text.rich(
                          TextSpan(
                            text: "Question ${cubit.questionNumber}",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: MyColors.kSecondaryColor),
                            children: [
                              TextSpan(
                                text: " /${cubit.quizzes.length}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: MyColors.kSecondaryColor),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1.5,
                          color: MyColors.kSecondaryColor,
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        Expanded(
                          child: PageView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            controller: cubit.pageController,
                            onPageChanged: cubit.updateTheQuestionNumber,
                            itemCount: allQuizzes.length,
                            itemBuilder: (context, index) => QuestionCard(
                              quizModel: allQuizzes[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.kGreyColor,
      ),
    );
  }
}
