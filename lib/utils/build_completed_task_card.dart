import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:task_flow_project/ux/resources/colors.dart';
import 'package:task_flow_project/ux/view_models/task_model.dart';

enum TaskStatus { completed, pending, canceled }

class BuildCompletedTaskCard extends StatefulWidget {
  const BuildCompletedTaskCard({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  State<BuildCompletedTaskCard> createState() => _BuildCompletedTaskCardState();
}

class _BuildCompletedTaskCardState extends State<BuildCompletedTaskCard> {
  @override
  Widget build(BuildContext context) {
    double cardHeight = 100;
    return Container(
      height: cardHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: widget.task.taskStatus == TaskStatus.completed
              ? ColorSource.success
              : ColorSource.danger,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: cardHeight - 12,
              width: cardHeight - 16,
              decoration: BoxDecoration(
                color: const Color.fromARGB(174, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(
                  HugeIcons.strokeRoundedAppleReminder,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.task.taskLabel,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          HugeIcons.strokeRoundedCalendar01,
                          size: 16,
                          color: ColorSource.cardGreyTextColor,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Sun",
                          style: TextStyle(
                            color: ColorSource.cardGreyTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 4),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorSource.cardGreyTextColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Feb 5, 2024",
                      style: TextStyle(
                        color: ColorSource.cardGreyTextColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorSource.cardGreyTextColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${widget.task.startTime} - ${widget.task.endTime}",
                      style: const TextStyle(
                        color: ColorSource.cardGreyTextColor,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      HugeIcons.strokeRoundedUser,
                      size: 14,
                      color: ColorSource.info,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Personal",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ColorSource.info,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: widget.task.taskStatus == TaskStatus.completed
                    ? ColorSource.success
                    : ColorSource.danger,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
