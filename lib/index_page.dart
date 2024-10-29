import 'package:flutter/material.dart';
import 'package:task_flow_project/ux/services/app_navigator.dart';
import 'package:task_flow_project/ux/views/onboarding/splash_screen.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();

    initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }

  void initializeApp() {
    /// all necessary logics before app starts go here
    /// delayed future should be removed after implementing start logics
    Future.delayed(
      const Duration(seconds: 3),
      () {
        AppNavigator.goToOnboarding();
      },
    );
  }
}
