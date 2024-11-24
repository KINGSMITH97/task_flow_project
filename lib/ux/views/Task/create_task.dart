import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:task_flow_project/utils/build_completed_task_card.dart';
import 'package:task_flow_project/utils/build_dropdown_field.dart';
import 'package:task_flow_project/utils/build_filled_button.dart';
import 'package:task_flow_project/utils/build_text_area.dart';
import 'package:task_flow_project/utils/build_text_field.dart';
import 'package:task_flow_project/ux/resources/constants.dart';
import 'package:task_flow_project/ux/services/app_navigator.dart';
import 'package:task_flow_project/ux/view_models/task_model.dart';
import 'package:intl/intl.dart'; // For formatting time

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  final List<String> tags = ['work', 'personal', 'urgent'];
  String? selectedTag;

  /// Method to show time picker and update the corresponding controller
  Future<void> _pickTime(
      BuildContext context, TextEditingController controller) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      final now = DateTime.now();
      final selectedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      String formattedTime =
          DateFormat('HH:mm').format(selectedDateTime); // Format time to HH:mm
      controller.text = formattedTime; // Set formatted time to the controller
    }
  }

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
                BuildTextField(
                  label: "Title",
                  controller: titleController,
                ),
                const SizedBox(height: 16),
                BuildTextField(
                  label: "Date",
                  controller: dateController,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _pickTime(context, startTimeController),
                        child: AbsorbPointer(
                          // Prevent manual editing of the field
                          child: BuildTextField(
                            controller: startTimeController,
                            label: "Start Time",
                            prefixIcon: HugeIcons.strokeRoundedTime04,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _pickTime(context, endTimeController),
                        child: AbsorbPointer(
                          // Prevent manual editing of the field
                          child: BuildTextField(
                            controller: endTimeController,
                            label: "End Time",
                            prefixIcon: HugeIcons.strokeRoundedTime04,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                BuildTextArea(
                  label: "Description",
                  controller: descriptionController,
                ),
                const SizedBox(height: 16),
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
                print(Constants.tasks.length);
                Constants.tasks.add(
                  Task(
                    id: Random().nextInt(100),
                    taskLabel: titleController.text,
                    description: descriptionController.text,
                    startTime: startTimeController.text,
                    endTime: endTimeController.text,
                    taskStatus: TaskStatus.pending,
                  ),
                );
                AppNavigator.goToHome();
                print(Constants.tasks.length);
              },
            ),
          ],
        ),
      ),
    );
  }
}
