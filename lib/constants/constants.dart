import 'package:flutter/material.dart';

final baseUrl = 'http://10.0.2.2:1337/'; //10.0.2.2 for android em
final endPoint = 'Models';
const quizScreen = '/quiz_screen';
const welcomeScreen = '/';
const scoreScreen = '/score_screen';

class MyColors {
  static const kSecondaryColor = Color(0xFF8B94BC);
  static const kGreenColor = Color(0xFF6AC259);
  static const kRedColor = Color(0xFFE92E30);
  static const kGreyColor = Color(0xFFC1C1C1);
  static const kBlackColor = Color(0xFF101010);
  static const kPrimaryGradient = LinearGradient(
    colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

const double kDefaultPadding = 20.0;
