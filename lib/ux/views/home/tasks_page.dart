import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:task_flow_project/utils/build_app_bar.dart';
import 'package:task_flow_project/utils/build_pending_task.dart';
import 'package:task_flow_project/utils/build_text_field.dart';

import 'package:task_flow_project/ux/resources/colors.dart';

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
      appBar: buildAppBar(title: "Hello, Melanie"),
      body: SingleChildScrollView(
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
              const SizedBox(height: 16),
              selectedTabIndex == 0 ? BuildTaskContent() : BuildGoalsContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTab({
    required String title,
    required IconData icon,
    required int currentIndex,
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Today's Pending Tasks",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {
                print("Add more");
              },
              child: const Text(
                "Add More",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: ColorSource.info,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const BuildPendingTask(
          startTime: "Any Time",
          endTime: "Any Time",
          taskLabel: "Take out the trash",
          deadline: "Due in 4hrs 32mins",
        ),
        const SizedBox(height: 16),
        const BuildPendingTask(
          startTime: "10:00 am",
          endTime: "10:15 am",
          taskLabel: "Wash the dishes",
          deadline: "Due in 4hrs 32mins",
        ),
        const SizedBox(height: 16),
        const BuildPendingTask(
          startTime: "10:30 pm",
          endTime: "Any Time",
          taskLabel: "Go and sell my certificate",
          deadline: "Due in 4hrs 32mins",
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Tasks Completed Today",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {
                print("Add more");
              },
              child: const Text(
                "Add More",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: ColorSource.info,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BuildGoalsContent extends StatelessWidget {
  const BuildGoalsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Goals');
  }
}
