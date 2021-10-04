import 'package:flutter/material.dart';
import 'package:flutter_interview/constants/constants.dart';
import 'package:lottie/lottie.dart';

Widget myBackgroundImage() {
  return Image.asset(
    'assets/images/my_background.jpeg',
    fit: BoxFit.cover,
    height: double.infinity,
    width: double.infinity,
    alignment: Alignment.center,
  );
}

Widget buildNoInternetWidget() {
  return Container(
    constraints: BoxConstraints.expand(),
    color: Color(0xFFe9074b),
    child: Column(
      children: [
        Spacer(
          flex: 3,
        ),
        Text(
          'Oops!',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'No Internet Connection!',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Spacer(),
        Lottie.asset("assets/images/no_internet.json"), //Lottie package to show animated pictures
        Spacer(
          flex: 3,
        ),
      ],
    ),
  );
}

Widget myMaterialButton({
  required VoidCallback? onPressed,
  double myWidth = 200,
  Alignment myAlignment = Alignment.center,
  TextStyle? textStyle,
  String? text,
}) {
  return MaterialButton(
    onPressed: onPressed,
    child: Container(
      width: myWidth,
      alignment: myAlignment,
      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
      decoration: BoxDecoration(
        gradient: MyColors.kPrimaryGradient,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        text!,
        style: textStyle,
      ),
    ),
  );
}
