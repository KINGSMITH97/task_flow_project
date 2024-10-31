import 'package:flutter/material.dart';
import 'package:task_flow_project/index_page.dart';
import 'package:task_flow_project/ux/views/onboarding/login_page.dart';
import 'package:task_flow_project/ux/views/onboarding/signup_page.dart';
import 'package:task_flow_project/ux/views/onboarding/onboarding_screen.dart';

class NavigationService {
  static const String entry = "/";
  static const String onboarding = "/onboarding";
  static const String login = "/login";
  static const String signUp = "/signUp";
  static const String home = "/home";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case entry:
        return MaterialPageRoute(
          builder: (context) => const IndexPage(),
          settings: settings,
        );

      case onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
          settings: settings,
        );
      case signUp:
        return MaterialPageRoute(
          builder: (context) => const CreateAccount(),
          settings: settings,
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const Login(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
