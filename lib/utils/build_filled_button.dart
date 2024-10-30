import 'package:flutter/material.dart';
import 'package:task_flow_project/ux/resources/colors.dart';

class BuildFilledButton extends StatelessWidget {
  const BuildFilledButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.width,
    this.icon,
    this.color,
    this.isOutline = false,
  });
  final String title;
  final IconData? icon;
  final Color? color;
  final VoidCallback onPressed;
  final bool isOutline;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: isOutline
            ? ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: ColorSource.strokeColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              )
            : ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: color ?? ColorSource.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon),
                  Text(
                    title,
                    style: const TextStyle(
                      color: ColorSource.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            : Text(
                title,
                style: TextStyle(
                  color: isOutline ? ColorSource.black : ColorSource.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
