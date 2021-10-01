import 'package:flutter/material.dart';
import 'package:flutter_interview/constants/constants.dart';
import 'package:flutter_interview/presentation/widgets/widgets.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return Stack(
            alignment: Alignment.center,
            children: [
              myBackgroundImage(),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                  ),
                  child: Column(
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      Text(
                        "Let's Play Quiz!",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(quizScreen);
                        },
                        child: Container(
                          width: 200,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                          decoration: BoxDecoration(
                            gradient: MyColors.kPrimaryGradient,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Text(
                            "Let's Get Started!",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return buildNoInternetWidget();
        }
      },
      child: Text('No Internet Connection')
      ),
    );
  }
}

Widget buildNoInternetWidget() {
  return Container(
  constraints: BoxConstraints.expand(),
    color: Color(0xFFe9074b),
    child: Column(
      children: [
        Spacer(flex: 3,),
        Text('Oops!',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        SizedBox(height: 5,),
      Text('No Internet Connection!',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),

          Spacer(),

        Lottie.asset("assets/images/no_internet.json"),
                Spacer(flex: 3,),

      ],
    ),
  );
}
