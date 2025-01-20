// import 'package:e_commerce/UI/extensions/text_style.dart';
// import 'package:flutter/material.dart';

// class CustomChipWidget extends StatelessWidget {
//   const CustomChipWidget({
//     super.key,
//     required this.onTap,
//     required this.icon,
//     required this.text,
//     this.backgroundColor = Colors.white,
//   });

//   final void Function()? onTap;
//   final Color? backgroundColor;
//   final IconData? icon;
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Row(
//             spacing: 8.0,
//             children: [
//               Icon(
//                 icon,
//                 color: Theme.of(context).colorScheme.secondary,
//               ),
//               text.textBody,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
