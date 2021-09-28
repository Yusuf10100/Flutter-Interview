import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_interview/business_logic/cubit/quiz_cubit.dart';
import 'package:flutter_interview/constants/constants.dart';
import 'package:flutter_interview/data/models/quiz_model.dart';
import 'package:flutter_interview/data/repository/quiz_repository.dart';

class QuestionCard extends StatelessWidget {
  final QuizModel quizModel;

  const QuestionCard({
    Key? key,
    required this.quizModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
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
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          ...List.generate(quizModel.options!.length, (index) {
            return Options(
              text: quizModel.options![index],
              index: index,
              press: () {
                QuizCubit.get(context).checkAns(quizModel, index);
                print(quizModel.toString());
                print(index);
              },
              // quizModel: quizModel,
            );
          }),
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback press;
  const Options({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = QuizCubit.get(context);
        Color getTheRightColor() {
          if (cubit.isAnswered) {
            if (index == cubit.correctAnswer) {
              return MyColors.kGreenColor;
            } else if (index == cubit.selectedAnswer &&
                cubit.selectedAnswer != cubit.correctAnswer) {
              return MyColors.kRedColor;
            }
          }
          return MyColors.kGreyColor;
        }

        IconData getTheRightIcon() {
          return getTheRightColor() == MyColors.kRedColor
              ? Icons.close
              : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index + 1} $text",
                  style: TextStyle(color: getTheRightColor(), fontSize: 16),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == MyColors.kGreyColor
                        ? Colors.transparent
                        : getTheRightColor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: getTheRightColor(),
                    ),
                  ),
                  child: getTheRightColor() == MyColors.kGreyColor ? null : Icon(
                    getTheRightIcon(),
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
