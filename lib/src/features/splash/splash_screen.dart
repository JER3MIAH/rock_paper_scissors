import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rock_paper_scissors/src/features/game/presentation/screens/screens.dart';
import 'package:rock_paper_scissors/src/shared/shared.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void pushToHome() {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => HomeScreen(),
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    }

    useEffect(() {
      Future.delayed(
        const Duration(milliseconds: 500),
        pushToHome,
      );
      return null;
    }, const []);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: appColors.backgroundGradient,
        ),
      ),
    );
  }
}
