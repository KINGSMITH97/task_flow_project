import 'package:flutter/material.dart';
import 'package:task_flow_project/ux/resources/colors.dart';
import 'package:task_flow_project/ux/view_models/task_model.dart';

class BuildPendingTaskCard extends StatefulWidget {
  const BuildPendingTaskCard({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  State<BuildPendingTaskCard> createState() => _BuildPendingTaskCardState();
}

class _BuildPendingTaskCardState extends State<BuildPendingTaskCard> {
  @override
  Widget build(BuildContext context) {
    double cardHeight = 100;
    return Container(
      height: cardHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorSource.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: ColorSource.info,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.startTime,
                  style: const TextStyle(
                    color: ColorSource.cardGreyTextColor,
                  ),
                ),
                Container(
                  height: 1,
                  width: 8,
                  color: ColorSource.cardGreyTextColor,
                ),
                Text(
                  widget.task.endTime,
                  style: const TextStyle(
                    color: ColorSource.cardGreyTextColor,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Container(
              height: cardHeight - (12 * 2),
              width: 2,
              color: ColorSource.info,
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.taskLabel,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "No description",
                  style: TextStyle(
                    color: ColorSource.cardGreyTextColor,
                  ),
                ),
                const Text(
                  "Due in 4hrs 32mins",
                  style: TextStyle(
                    color: ColorSource.info,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
