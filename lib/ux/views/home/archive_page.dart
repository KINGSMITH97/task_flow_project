import 'package:flutter/material.dart';
import 'package:task_flow_project/utils/build_app_bar.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Archive"),
    );
  }
}
