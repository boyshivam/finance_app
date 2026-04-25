// import "package:flutter/material.dart";
//
//
// class CardIndicator extends StatefulWidget {
//   const CardIndicator({super.key});
//
//   @override
//   State<CardIndicator> createState() => _CardIndicatorState();
// }
//
// class _CardIndicatorState extends State<CardIndicator> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(cards.length, (index) {
//         bool isActive = index == currentIndex;
//
//         return AnimatedContainer(
//           duration: Duration(milliseconds: 200),
//           margin : EdgeInsets.symmetric(horizontal: 4),
//
//           width: isActive ? 25 : 10,
//           height: 10,
//
//           decoration: BoxDecoration(
//             color: Colors.grey,
//             borderRadius: BorderRadius.circular(20)
//           ),
//         )
//       }
//       ),
//     );
//   }
// }
