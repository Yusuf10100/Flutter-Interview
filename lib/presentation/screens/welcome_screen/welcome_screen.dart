import 'package:flutter/material.dart';
import 'package:flutter_interview/constants/constants.dart';
import 'package:flutter_interview/presentation/widgets/widets.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         myBackgroundImage(),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 2,), 
                Text(
                  "Prepare well for your interview",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                    decoration:BoxDecoration(
                      gradient: MyColors.kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      "Let's Get Started!",
                      style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black),
                    ),
                  ),
                ),
                Spacer(flex: 2,), 
              ],
            ),
          ),),
        ],
      ),
    );
  }
}
