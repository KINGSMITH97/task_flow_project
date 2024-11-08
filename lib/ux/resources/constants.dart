import 'package:task_flow_project/utils/build_completed_task_card.dart';
import 'package:task_flow_project/ux/resources/images.dart';
import 'package:task_flow_project/ux/view_models/task_model.dart';

class Constants {
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

  List<Task> tasks = [
    Task(
      taskLabel: "Workout",
      startTime: "8:00am",
      endTime: "8:25am",
      taskStatus: TaskStatus.completed,
    ),
    Task(
      taskLabel: "Go see a friend",
      startTime: "10:00am",
      endTime: "11:20am",
      taskStatus: TaskStatus.canceled,
    ),
    Task(
      taskLabel: "Take out the trash",
      startTime: "Any Time",
      endTime: "Any Time",
      taskStatus: TaskStatus.pending,
    ),
    Task(
      taskLabel: "Wash the dishes",
      startTime: "10:00am",
      endTime: "10:25am",
      taskStatus: TaskStatus.pending,
    ),
    Task(
      taskLabel: "Sweep and clean the house",
      startTime: "8:00am",
      endTime: "8:25am",
      taskStatus: TaskStatus.pending,
    )
  ];
}
