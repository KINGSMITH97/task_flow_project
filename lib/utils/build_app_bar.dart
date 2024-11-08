import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:task_flow_project/ux/resources/colors.dart';

PreferredSizeWidget buildAppBar({
  required String title,
}) {
  return AppBar(
    backgroundColor: ColorSource.white,
    scrolledUnderElevation: 0,
    automaticallyImplyLeading: false,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: const [
      HugeIcon(
        icon: HugeIcons.strokeRoundedNotification01,
        size: 24,
        color: ColorSource.black,
      ),
      SizedBox(width: 16),
      HugeIcon(
        icon: HugeIcons.strokeRoundedLogout03,
        size: 24,
        color: ColorSource.danger,
      ),
      SizedBox(width: 16),
    ],
  );
}
