import 'package:flutter/material.dart';
import 'package:task_flow_project/ux/services/navigation_service.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static void goToOnboarding() {
    navigateTo(NavigationService.onboarding, popAllPrevious: true);
  }

  static void goToHome() {
    navigateTo(NavigationService.home, popAllPrevious: true);
  }

  static void navigateTo(
    String path, {
    dynamic args,
    bool? popAllPrevious,
    bool? replace,
    Function(dynamic)? onPopCallback,
  }) {
    // push and remove all other screens in navigation stack
    if (popAllPrevious == true) {
      navKey.currentState
          ?.pushNamedAndRemoveUntil(path, (route) => false, arguments: args);
      return;
    }

    // push replacement
    if (replace == true) {
      navKey.currentState
          ?.pushReplacementNamed(path, arguments: args)
          .then((value) {
        onPopCallback?.call(value);
      });
      return;
    }

    // push
    navKey.currentState?.pushNamed(path, arguments: args).then((value) {
      onPopCallback?.call(value);
    });
  }
}
