import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flow_project/models/task.dart';
import 'package:task_flow_project/providers/task_provider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.onTap,
    this.isGridView = false,
  });
  final Task task;
  final VoidCallback onTap;
  final bool isGridView;

  Color _getPriorityColor() {
    switch (task.priority) {
      case Priority.high:
        return Colors.red.shade100;
      case Priority.medium:
        return Colors.orange.shade100;
      case Priority.low:
        return Colors.green.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: _getPriorityColor(),
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: isGridView ? _buildGridContent() : _buildListContent(),
        ),
      ),
    );
  }

  Widget _buildListContent() {
    return Row(
      children: [
        _buildCheckBox(),
        const SizedBox(width: 16),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            if (task.description.isNotEmpty) ...[
              const SizedBox(height: 4),
              _buildDescription(),
            ],
            const SizedBox(height: 8),
            _buildFooter(),
          ],
        )),
      ],
    );
  }

  Widget _buildGridContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildCheckBox(),
            const SizedBox(width: 8),
            Expanded(child: _buildTitle()),
          ],
        ),
        if (task.description.isNotEmpty) ...[
          const SizedBox(height: 8),
          _buildDescription(),
        ],
        const Spacer(),
        _buildFooter(),
      ],
    );
  }

  Widget _buildCheckBox() {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        return Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            taskProvider.toggleTaskComplete(task.id);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Text(
      task.title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        decoration: task.isCompleted ? TextDecoration.lineThrough : null,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription() {
    return Text(
      task.description,
      style: TextStyle(
        color: Colors.grey[600],
        decoration: task.isCompleted ? TextDecoration.lineThrough : null,
      ),
      maxLines: isGridView ? 2 : 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildFooter() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: _getPriorityColor(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            task.priority.name.toUpperCase(),
            style: const TextStyle(fontSize: 12),
          ),
        ),
        if (task.tags.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              task.tags.first,
              style: const TextStyle(fontSize: 12),
            ),
          ),
      ],
    );
  }
}
