import 'package:flutter/material.dart';
import 'package:task_flow_project/ux/resources/colors.dart';

class BuildTextArea extends StatelessWidget {
  const BuildTextArea({
    super.key,
    required this.label,
    this.prefixIcon,
  });
  final String label;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: ColorSource.inputLabelColor,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: ColorSource.indicatorColor,
                size: 20,
              )
            : null,
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: ColorSource.strokeColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: ColorSource.strokeColor,
          ),
        ),
      ),
    );
  }
}
