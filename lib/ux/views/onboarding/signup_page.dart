import 'package:flutter/material.dart';
import 'package:task_flow_project/utils/build_filled_button.dart';
import 'package:task_flow_project/utils/build_text_field.dart';
import 'package:task_flow_project/ux/resources/colors.dart';
import 'package:task_flow_project/ux/services/app_navigator.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: double.infinity,
                        color: ColorSource.black,
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Create Account",
                                style: TextStyle(
                                  color: ColorSource.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Welcome to Taskflow, your personal companion for a productive day!. Seamlessly organize and track your daily activies",
                                style: TextStyle(
                                  color: ColorSource.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            BuildTextField(label: "Email"),
                            SizedBox(height: 24),
                            BuildTextField(label: "Password"),
                            SizedBox(height: 24),
                            BuildTextField(label: "Confirm Password"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Anonymous Sign in",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    BuildFilledButton(
                      title: "Signup",
                      onPressed: () => AppNavigator.goToHome(),
                      width: double.infinity,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () => AppNavigator.goToLogin(),
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
