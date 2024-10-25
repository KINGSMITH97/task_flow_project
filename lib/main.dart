import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flow_project/providers/task_provider.dart';
import 'package:task_flow_project/providers/theme_provider.dart';
import 'package:task_flow_project/screens/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const TaskFlowApp(),
    ),
  );
}

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: "TaskFlow",
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness:
                themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
