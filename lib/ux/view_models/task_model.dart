import 'package:task_flow_project/utils/build_completed_task_card.dart';

class Task {
  final String taskLabel;
  final String? description;
  final String startTime;
  final String endTime;
  final TaskStatus taskStatus;

  Task({
    required this.taskLabel,
    this.description,
    required this.startTime,
    required this.endTime,
    required this.taskStatus,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskLabel: json['taskLabel'] as String,
      description: json['description'] as String?,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      taskStatus: TaskStatus.values.firstWhere(
        (status) => status.toString() == 'TaskStatus.${json['taskStatus']}',
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskLabel': taskLabel,
      'description': description,
      'startTime': startTime,
      'endTime': endTime,
      'taskStatus': taskStatus.toString().split('.').last,
    };
  }
}
