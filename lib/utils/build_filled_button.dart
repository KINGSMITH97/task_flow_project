// import 'package:flutter/material.dart';
// import 'package:task_flow_project/ux/resources/colors.dart';

// class BuildFilledButton extends StatelessWidget {
//   const BuildFilledButton({
//     super.key,
//     required this.title,
//     required this.onPressed,
//     this.width,
//     this.icon,
//     this.color,
//     this.isOutline = false,
//   });
//   final String title;
//   final IconData? icon;
//   final Color? color;
//   final VoidCallback onPressed;
//   final bool isOutline;
//   final double? width;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final buttonWidth = width ?? screenWidth * 0.8;
//     return SizedBox(
//       height: 52,
//       width: buttonWidth,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: isOutline
//             ? ElevatedButton.styleFrom(
//                 elevation: 0,
//                 backgroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                     color: ColorSource.strokeColor,
//                     width: 1,
//                   ),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               )
//             : ElevatedButton.styleFrom(
//                 elevation: 0,
//                 backgroundColor: color ?? ColorSource.black,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//         child: icon != null
//             ? Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(icon),
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       color: ColorSource.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               )
//             : Text(
//                 title,
//                 style: TextStyle(
//                   color: isOutline ? ColorSource.black : ColorSource.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:task_flow_project/ux/resources/colors.dart';

class BuildFilledButton extends StatelessWidget {
  const BuildFilledButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.icon,
    this.color,
    this.isOutline = false,
  });

  final String title;
  final IconData? icon;
  final Color? color;
  final VoidCallback onPressed;
  final bool isOutline;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = width ?? screenWidth * 0.8;

    return SizedBox(
      height: 52,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              isOutline ? ColorSource.white : color ?? ColorSource.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: isOutline
                ? const BorderSide(
                    color: ColorSource.strokeColor,
                    width: 1,
                  )
                : BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon,
                  color: isOutline ? ColorSource.black : ColorSource.white),
              const SizedBox(width: 8),
            ],
            Text(
              title,
              style: TextStyle(
                color: isOutline ? ColorSource.black : ColorSource.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
