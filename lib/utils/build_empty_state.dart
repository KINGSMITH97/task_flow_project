import 'package:flutter/material.dart';
import 'package:task_flow_project/ux/resources/colors.dart';

class BuildEmptyState extends StatelessWidget {
  const BuildEmptyState({
    super.key,
    required this.caption,
    required this.buttonLabel,
    this.onTap,
  });
  final String caption;
  final String buttonLabel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            caption,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                color: ColorSource.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  buttonLabel,
                  style: const TextStyle(
                    color: ColorSource.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
