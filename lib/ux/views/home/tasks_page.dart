import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:task_flow_project/utils/build_app_bar.dart';
import 'package:task_flow_project/utils/build_completed_task_card.dart';
import 'package:task_flow_project/utils/build_empty_state.dart';
import 'package:task_flow_project/utils/build_pending_task.dart';
import 'package:task_flow_project/utils/build_text_field.dart';

import 'package:task_flow_project/ux/resources/colors.dart';
import 'package:task_flow_project/ux/resources/constants.dart';
import 'package:task_flow_project/ux/services/app_navigator.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSource.white,
      appBar: buildAppBar(title: "Hello, Melanie"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Container(
                height: 72,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorSource.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedTabIndex = 0;
                          });
                        },
                        child: buildSectionTab(
                          currentIndex: 0,
                          title: "Tasks",
                          icon: HugeIcons.strokeRoundedTask01,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedTabIndex = 1;
                          });
                        },
                        child: buildSectionTab(
                          currentIndex: 1,
                          title: "Goals",
                          icon: HugeIcons.strokeRoundedChampion,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const BuildTextField(
                prefixIcon: HugeIcons.strokeRoundedSearch01,
                label: "Search your tasks",
              ),
              const SizedBox(height: 24),
              selectedTabIndex == 0
                  ? const BuildTaskContent()
                  : const BuildGoalsContent(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                backgroundColor: ColorSource.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                title: const Text(
                  'Create a new',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                children: [
                  SimpleDialogOption(
                    onPressed: () {
                      AppNavigator.goToCreateTask();
                    },
                    child: buildSectionTab(
                      title: "Tasks",
                      icon: HugeIcons.strokeRoundedTask01,
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {},
                    child: buildSectionTab(
                      title: "Goals",
                      icon: HugeIcons.strokeRoundedChampion,
                    ),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: ColorSource.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          HugeIcons.strokeRoundedAdd01,
          color: ColorSource.white,
        ),
      ),
    );
  }

  Widget buildSectionTab({
    required String title,
    required IconData icon,
    int? currentIndex,
  }) {
    return Container(
      height: 50,
      width: 160,
      decoration: BoxDecoration(
        color: selectedTabIndex == currentIndex
            ? ColorSource.white
            : ColorSource.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 18,
            color: selectedTabIndex == currentIndex
                ? ColorSource.black
                : ColorSource.white,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: selectedTabIndex == currentIndex
                  ? ColorSource.black
                  : ColorSource.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildTaskContent extends StatelessWidget {
  const BuildTaskContent({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final pendingTasks = Constants()
        .tasks
        .where((task) => task.taskStatus.name == "pending")
        .toList();

    //
    final completedTasks = Constants()
        .tasks
        .where((task) => task.taskStatus.name == "completed")
        .toList();

    //
    final canceledTasks = Constants()
        .tasks
        .where((task) => task.taskStatus.name == "canceled")
        .toList();

    return Column(
      children: [
        buildSectionHeader(
          sectionHeading: "Today's Pending Tasks",
          onTap: () {},
        ),
        const SizedBox(height: 16),
        //
        pendingTasks.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Constants()
                    .tasks
                    .where((task) => task.taskStatus.name == "pending")
                    .length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: BuildPendingTaskCard(
                      task: pendingTasks[index],
                    ),
                  );
                },
              )
            : BuildEmptyState(
                caption: "Oops! You have no pending tasks for today",
                buttonLabel: "Schedule Task",
                onTap: () {},
              ),

        const SizedBox(height: 16),
        buildSectionHeader(
          sectionHeading: "Tasks Completed Today",
          onTap: () {},
        ),
        const SizedBox(height: 16),
        completedTasks.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Constants()
                    .tasks
                    .where((task) => task.taskStatus.name == "completed")
                    .length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: BuildCompletedTaskCard(
                      task: completedTasks[index],
                    ),
                  );
                },
              )
            : BuildEmptyState(
                caption: "Oops! You have no completed tasks",
                buttonLabel: "Schedule Task",
                onTap: () {},
              ),
        const SizedBox(height: 8),
        buildSectionHeader(
          sectionHeading: "Tasks Cancelled Today",
          onTap: () {},
        ),
        const SizedBox(height: 16),

        canceledTasks.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Constants()
                    .tasks
                    .where((task) => task.taskStatus.name == "canceled")
                    .length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: BuildCompletedTaskCard(
                      task: canceledTasks[index],
                    ),
                  );
                },
              )
            : BuildEmptyState(
                caption: "Oops! You have no canceled task for today",
                buttonLabel: "Schedule Task",
                onTap: () {},
              ),
      ],
    );
  }
}

Widget buildSectionHeader({
  required String sectionHeading,
  required Function() onTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        sectionHeading,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      InkWell(
        onTap: onTap,
        child: const Text(
          "See More",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: ColorSource.info,
          ),
        ),
      ),
    ],
  );
}

class BuildGoalsContent extends StatelessWidget {
  const BuildGoalsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Goals');
  }
}
