import 'package:flutter/material.dart';
import 'package:task_flow_project/ux/resources/colors.dart';
import 'package:task_flow_project/ux/resources/images.dart';
import 'package:task_flow_project/ux/resources/strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSource.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(image: Images.appLogo),
              ),
            ),
            //const SizedBox(height: 8),
            const Text(
              Strings.appName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
