import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:task_flow_project/utils/build_app_bar.dart';
import 'package:task_flow_project/utils/build_completed_task_card.dart';
import 'package:task_flow_project/utils/build_dropdown_field.dart';
import 'package:task_flow_project/utils/build_filled_button.dart';
import 'package:task_flow_project/utils/build_text_area.dart';
import 'package:task_flow_project/utils/build_text_field.dart';
import 'package:task_flow_project/ux/resources/constants.dart';
import 'package:task_flow_project/ux/services/app_navigator.dart';
import 'package:task_flow_project/ux/view_models/task_model.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final List<String> tags = ['work', 'personal', 'urgent'];
  String? selectedTag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            HugeIcons.strokeRoundedArrowLeft01,
          ),
        ),
        title: const Text(
          "Create a Task",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                BuildTextField(label: "Title"),
                SizedBox(height: 16),
                BuildTextField(label: "Date"),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: BuildTextField(
                        label: "Start Time",
                        prefixIcon: HugeIcons.strokeRoundedTime04,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: BuildTextField(
                        label: "End Time",
                        prefixIcon: HugeIcons.strokeRoundedTime04,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                BuildTextArea(label: "Description"),
                SizedBox(height: 16),
                BuildDropdownField(
                  tags: tags,
                  initialValue: selectedTag,
                  labelText: 'Task tag',
                  onTagSelected: (String? newValue) {
                    setState(() {
                      selectedTag = newValue;
                    });
                  },
                ),
              ],
            ),
            BuildFilledButton(
              width: double.infinity,
              title: "Create Task",
              onPressed: () {
                print(Constants().tasks.length);
                Constants().tasks.add(
                      Task(
                          taskLabel: "taskLabel",
                          startTime: "startTime",
                          endTime: "endTime",
                          taskStatus: TaskStatus.pending),
                    );
                AppNavigator.goToHome();
                print(Constants().tasks.length);
              },
            ),
          ],
        ),
      ),
    );
  }
}
