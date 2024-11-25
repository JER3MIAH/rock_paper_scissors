import 'package:rock_paper_scissors/src/features/splash/splash_screen.dart';
import 'package:rock_paper_scissors/src/shared/shared.dart';
import 'package:flutter/material.dart';

import 'features/game/presentation/screens/screens.dart';
import 'features/navigation/nav.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rock Paper Scissors',
      theme: appTheme,
      routes: {
        AppRoutes.splash: (context) => SplashScreen(),
        AppRoutes.home: (context) => HomeScreen(),
      },
      initialRoute: AppRoutes.splash,
    );
  }
}
