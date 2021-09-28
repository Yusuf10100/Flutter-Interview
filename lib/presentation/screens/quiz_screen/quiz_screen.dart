import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/business_logic/cubit/quiz_cubit.dart';
import 'package:flutter_interview/constants/constants.dart';
import 'package:flutter_interview/data/models/quiz_model.dart';
import 'package:flutter_interview/data/repository/quiz_repository.dart';
import 'package:flutter_interview/presentation/widgets/widets.dart';

import 'components/question_card.dart';

// class QuizScreen extends StatefulWidget {
//   @override
//   _QuizScreenState createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   late List<QuizModel> allQuizzes;
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<QuizCubit>(context).getAllQuizzes();
//   }

//   // Widget buildBlocWidget() {
//   //   return BlocBuilder<QuizCubit, QuizState>(builder: (context, state) {
//   //     if (state is QuizzesLoaded) {
//   //       allQuizzes = (state).quizzes;
//   //       return buildLoadedListWidget();
//   //     } else {
//   //       return showLoadingIndicator();
//   //     }
//   //   });
//   // }

//   // Widget showLoadingIndicator() {
//   //   return Center(
//   //     child: CircularProgressIndicator(
//   //       color: MyColors.kGreyColor,
//   //     ),
//   //   );
//   // }

//   // Widget buildLoadedListWidget() {
//   //   return Expanded(
//   //     child: PageView.builder(
//   //       itemCount: allQuizzes.length,
//   //       itemBuilder: (context, index) => QuestionCard(
//   //         quizModel: allQuizzes[index],
//   //       ),
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           myBackgroundImage(),
//           SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: kDefaultPadding, vertical: kDefaultPadding * 2),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text.rich(
//                     TextSpan(
//                       text: "Question",
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline4!
//                           .copyWith(color: MyColors.kSecondaryColor),
//                       children: [
//                         TextSpan(
//                           text: " /10",
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline5!
//                               .copyWith(color: MyColors.kSecondaryColor),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     thickness: 1.5,
//                     color: MyColors.kSecondaryColor,
//                   ),
//                   SizedBox(
//                     height: kDefaultPadding,
//                   ),
//                   buildBlocWidget(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
        if (state is QuizzesLoaded) {
          allQuizzes = (state).quizzes;
          return Scaffold(
            body: Stack(
              children: [
                myBackgroundImage(),
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
                            text: "Question",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: MyColors.kSecondaryColor),
                            children: [
                              TextSpan(
                                text: " /10",
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
                        buildLoadedListWidget(),
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

  Widget buildLoadedListWidget() {
    return Expanded(
      child: PageView.builder(
        itemCount: allQuizzes.length,
        itemBuilder: (context, index) => QuestionCard(
          quizModel: allQuizzes[index],
        ),
      ),
    );
  }
}
