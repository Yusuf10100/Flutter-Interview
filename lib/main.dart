import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/app_router.dart';

import 'business_logic/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //make sure initializing everything before running the app
  Bloc.observer = MyBlocObserver();

  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,      
    );
  }
}
