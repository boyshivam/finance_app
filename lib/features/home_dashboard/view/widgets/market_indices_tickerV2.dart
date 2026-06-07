import "package:flutter/material.dart";

class MarketIndicesTickerV2 extends StatefulWidget {
  const MarketIndicesTickerV2({super.key});

  @override
  State<MarketIndicesTickerV2> createState() => _MarketIndicesTickerV2State();
}

class _MarketIndicesTickerV2State extends State<MarketIndicesTickerV2>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  static const double contentWidth = 800;

  // initiate the controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  // this is the market indices repeating continuously in dashboard
  Widget marketIndices() {
    return const Row(
      children: [
        Text("NIFTY +0.52%"),
        SizedBox(width: 32),
        Text("SENSEX +0.26%"),
        SizedBox(width: 32),
        Text("NASDAQ -0.11%"),
        SizedBox(width: 32),
      ],
    );
  }

  // dispose the animation controller
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ClipRect(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            final dx = -(contentWidth * animationController.value);
        
            return Transform.translate(offset: Offset(dx, 0), child: child);
          },
          child: Row(children: [marketIndices(), marketIndices()]),
        ),
      ),
    );
  }
}
