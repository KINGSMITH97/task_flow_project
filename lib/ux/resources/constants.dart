import 'package:intl/intl.dart';
import 'package:task_flow_project/utils/build_completed_task_card.dart';
import 'package:task_flow_project/ux/resources/images.dart';
import 'package:task_flow_project/ux/view_models/task_model.dart';

class Constants {
  final now = DateTime.now();

  List<Map<String, dynamic>> onboardingContent = [
    {
      "title": "Track Daily Activities",
      "content":
          "Staying on top on your daily activities has never been easier . Our app gives you the tools to track your activities and boost productivity.",
      "image": Images.illustrationImage1,
    },
    {
      "title": "Set and Complete Goals",
      "content":
          "Stay motivated and reac your full potential by setting and completing goals within our app. Break down your dreams into actionable tasks.",
      "image": Images.illustrationImage2,
    },
    {
      "title": "Performance Analysis",
      "content":
          "Gain valuable insights into your productivity and efficiency with our compreensive analysis tools. Dive into detailed reports and metrics about tasks.",
      "image": Images.illustrationImage3,
    },
  ];

  static final List<Task> tasks = [
    Task(
      id: 5,
      taskLabel: "Workout",
      startTime: DateFormat('HH:mm').format(DateTime.now()),
      endTime: DateFormat('HH:mm').format(DateTime.now()),
      taskStatus: TaskStatus.completed,
    ),
    Task(
      id: 4,
      taskLabel: "Write flutter codes",
      startTime: DateFormat('HH:mm').format(DateTime.now()),
      endTime: DateFormat('HH:mm').format(DateTime.now()),
      taskStatus: TaskStatus.completed,
    ),
    Task(
      id: 3,
      taskLabel: "Go see a friend",
      startTime: DateFormat('HH:mm').format(DateTime.now()),
      endTime: DateFormat('HH:mm').format(DateTime.now()),
      taskStatus: TaskStatus.canceled,
    ),
    Task(
      id: 2,
      taskLabel: "Travel with granny",
      startTime: DateFormat('HH:mm').format(DateTime.now()),
      endTime: DateFormat('HH:mm').format(DateTime.now()),
      taskStatus: TaskStatus.canceled,
    ),
    Task(
      id: 1,
      taskLabel: "Take out the trash",
      startTime: DateFormat('HH:mm').format(DateTime.now()),
      endTime: DateFormat('HH:mm').format(DateTime.now()),
      taskStatus: TaskStatus.pending,
    ),
    Task(
      id: 6,
      taskLabel: "Wash the dishes",
      startTime: DateFormat('HH:mm').format(DateTime.now()),
      endTime: DateFormat('HH:mm').format(DateTime.now()),
      taskStatus: TaskStatus.pending,
    ),
    Task(
      id: 7,
      taskLabel: "Sweep and clean the house",
      startTime: DateFormat('HH:mm').format(DateTime.now()),
      endTime: DateFormat('HH:mm').format(DateTime.now()),
      taskStatus: TaskStatus.pending,
    )
  ];
}
