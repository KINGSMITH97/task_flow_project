import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flow_project/ux/view_models/demo_view_model.dart';

class AppBase extends StatelessWidget {
  const AppBase({super.key, required this.app});

  final Widget app;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// providers are initialized here
      providers: [
        ListenableProvider(
          create: (_) => DemoViewModel(),
        ),
      ],
      child: app,
    );
  }
}
