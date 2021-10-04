import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/* Get_it package for service locator that is used to navigate 
and pop up alert dialog without context */
GetIt locator = GetIt.instance;

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void setupLocator() {
    locator.registerLazySingleton(() => NavigationService());
  }

  void showMyDialog(String errorMessage) {
    showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => Center(
              child: Material(
                color: Colors.red,
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ));
  }
}
