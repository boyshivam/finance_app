//
// import "package:flutter/material.dart";
// import 'package:flutter/cupertino.dart';
//
// class ValidationSnackbar extends StatelessWidget {
//   const ValidationSnackbar({
//     super.key,
//     required this.message});
//
//
//   final String message;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//     )
//       ScaffoldMessenger.of(context).clearSnackBars();
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             backgroundColor: AppColorsCommon.snackBarMsgBlue,
//
//             duration: Duration(seconds: 1),
//             content: Row(
//               children: [
//                 AssetImageHelper.image(AppAssetsCommon.snackBarTick,
//                     width: 24, height: 24),
//                 const SizedBox(width: 10),
//                 Text("Mobile number verified successfully!", style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                     color: Colors.white
//                 ),),
//               ],
//             ))
//     );;
//   }
// }
