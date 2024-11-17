import 'package:flutter/material.dart';
import 'package:task_flow_project/ux/resources/colors.dart';

class BuildDropdownField extends StatelessWidget {
  const BuildDropdownField({
    super.key,
    required this.tags,
    this.initialValue,
    this.onTagSelected,
    this.labelText = "Select a Tag",
  });

  final List<String> tags;
  final String? initialValue;
  final ValueChanged<String?>? onTagSelected;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: ColorSource.inputLabelColor,
        ),
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
      value: initialValue,
      hint: Text(labelText),
      items: tags.map((String tag) {
        return DropdownMenuItem(
          value: tag,
          child: Text(tag),
        );
      }).toList(),
      onChanged: onTagSelected,
    );
  }
}
