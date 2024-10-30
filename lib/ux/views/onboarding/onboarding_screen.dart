import 'package:flutter/material.dart';
import 'package:task_flow_project/utils/build_filled_button.dart';
import 'package:task_flow_project/ux/resources/colors.dart';
import 'package:task_flow_project/ux/resources/constants.dart';
import 'package:task_flow_project/ux/resources/images.dart';
import 'package:task_flow_project/ux/resources/strings.dart';
import 'package:task_flow_project/ux/services/app_navigator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSource.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            SizedBox(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: 5,
                        width: 100,
                        decoration: BoxDecoration(
                            color: currentIndex >= index
                                ? ColorSource.black
                                : ColorSource.indicatorColor,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: Constants().onboardingContent.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: Constants().onboardingContent[index]
                                    ["image"]),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          Constants().onboardingContent[index]["title"],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          Constants().onboardingContent[index]["content"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Spacer()
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BuildFilledButton(
                    onPressed: () {
                      if (currentIndex ==
                          Constants().onboardingContent.length - 1) {
                        AppNavigator.goToHome();
                      }
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    title:
                        currentIndex == Constants().onboardingContent.length - 1
                            ? "Get Started"
                            : "Next",
                    width: 200,
                  ),
                  BuildFilledButton(
                    title: "Skip",
                    onPressed: () {
                      AppNavigator.goToHome();
                    },
                    width: 120,
                    isOutline: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
