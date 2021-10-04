import 'package:flutter/material.dart';
import 'package:flutter_interview/constants/constants.dart';
import 'package:flutter_interview/presentation/widgets/widgets.dart';
import 'package:flutter_offline/flutter_offline.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
          connectivityBuilder: (
            //check internet connectivity
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
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                   ),
                          ),
                          Spacer(),
                          myMaterialButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(quizScreen);
                            },
                            text: "Let's Get Started!",
                            textStyle: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.black),
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
          child: Text('No Internet Connection',)),
    );
  }
}
