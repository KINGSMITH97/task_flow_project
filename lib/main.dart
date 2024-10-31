import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_flow_project/ux/common/views/app_base.dart';
import 'package:task_flow_project/ux/services/app_navigator.dart';
import 'package:task_flow_project/ux/services/navigation_service.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      // WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

      runApp(
        const AppBase(
          app: TaskFlowApp(),
        ),
      );
    },
    (error, stack) {
      log(
        "Error occurred with details:\nError: $error\nStacktrace: $stack",
      );
    },
  );
}

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TaskFlow",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Quicksand",
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navKey,
      onGenerateRoute: NavigationService.onGenerateRoute,
      initialRoute: NavigationService.entry,
    );
  }
}
