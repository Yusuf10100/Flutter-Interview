import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_interview/constants/constants.dart';
import 'package:flutter_interview/data/models/quiz_model.dart';
import 'package:flutter_interview/logic/cubit/quiz_cubit.dart';

import 'options.dart';

class QuestionCard extends StatelessWidget {
  final QuizModel quizModel;

  const QuestionCard({
    Key? key,
    required this.quizModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = QuizCubit.get(context);
        return Container(
          padding: EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "${quizModel.question}".isEmpty
                      ? "Please Wait..."
                      : "${quizModel.question}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: MyColors.kBlackColor),
                ),
                ...List.generate(quizModel.options!.length, (index) {
                  return Options(
                    text: quizModel.options![index],
                    index: index,
                    press: () {
                      cubit.checkAns(quizModel, index);
                   
                    },
                    // quizModel: quizModel,
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
