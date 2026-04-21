// import "dart:math";
// import "package:aprreciate/models/home_dashboard/trading_signal_model.dart";
// import "package:flutter/material.dart";
// import "package:flutter/animation.dart";
//
// class TradingSignalCarousel extends StatefulWidget {
//   const TradingSignalCarousel({super.key, required this.tradingSignalCards});
//
//   final List<TradingSignalModel> tradingSignalCards;
//
//   @override
//   State<TradingSignalCarousel> createState() => _TradingSignalCarouselState();
// }
//
// class _TradingSignalCarouselState extends State<TradingSignalCarousel> {
//   late PageController _controller;
//   double currentPage = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     _controller = PageController(viewportFraction: 0.75);
//
//     _controller.addListener(() {
//       setState(() {
//         currentPage = _controller.page ?? 0;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 450,
//       child: PageView.builder(
//           itemCount: widget.tradingSignalCards.length,
//           itemBuilder: (context, index) {
//             // distance of card from center
//             double distance = (currentPage - index).abs();
//
//             // scale effect
//             double scale = max(0.85, 1 - (distance * 0.15));
//
//             // fade effect
//             double opacity = max(0.35, 1 - (distance * 0.5));
//
//             // vertical shit for depth illusion
//             double translate_Y = distance * 30;
//
//             return TweenAnimationBuilder(
//                 tween: Tween(
//                   begin: scale,
//                   end: scale,
//                 ),
//                 duration: Duration(
//                   milliseconds: 200
//                 ),
//
//                 curve: Curves.easeOutCubic,
//
//                 builder: (context, value, child));
//           }),
//     );
//   }
// }
