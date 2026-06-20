import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class PortfolioStatusViewer extends StatelessWidget {
  const PortfolioStatusViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppColorsCommon.lightGreen,
              border: Border.all(color: AppColorsCommon.positiveGreen, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "₹40,000.00",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: AppColorsCommon.positiveGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.value_growth_icon,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "0.025",
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColorsCommon.positiveGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 100,
          top: 25,
          child: Container(
            width: 200,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: AppColorsCommon.appWhite
            ),
            child: Row(
              children: [

              ],
            ),
          ),
        ),
        Positioned(
          top: 140,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Container(
                padding: EdgeInsets.all(15),
                height: 150,
                decoration: BoxDecoration(
                  color: AppColorsCommon.appWhite,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("Invested"),
                        const SizedBox(),
                        Text("Rs 9,00,000")
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text("Current"),
                        const SizedBox(),
                        Text("Rs 9,25,000")
                      ],
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
