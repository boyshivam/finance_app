import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class SecurityDetails extends StatelessWidget {
  const SecurityDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColorsCommon.appWhite,
        ),
        child: Row(
          children: [
            Row(
              children: [
                Image.asset(AppAssets.tesla_icon, width: 40, height: 40),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TESLA",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Tesla, inc",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  "\$9,921.06",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10,),
                Icon(Icons.arrow_drop_down_circle_outlined, size: 25, color: Colors.black,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
