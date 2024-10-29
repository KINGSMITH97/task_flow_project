import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash Screen\nwill navigate to onboarding screen in 3 seconds",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
