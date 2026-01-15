import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_paper_scissors/src/features/game/logic/blocs/blocs.dart';
import 'package:rock_paper_scissors/src/features/game/logic/services/services.dart';
import 'package:rock_paper_scissors/src/features/splash/splash_screen.dart';
import 'package:rock_paper_scissors/src/shared/shared.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GameBloc(service: GameService())
            ..add(
              SetGameType(isBonus: true),
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rock Paper Scissors',
        theme: appTheme,
        home: SplashScreen(),
      ),
    );
  }
}
