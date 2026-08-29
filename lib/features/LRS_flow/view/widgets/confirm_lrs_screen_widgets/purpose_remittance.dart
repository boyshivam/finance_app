import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class PurposeRemittanceSection extends StatelessWidget {
  const PurposeRemittanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Purpose of remittance",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColorsCommon.snackBarMsgBlue,
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Purpose Code",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600),

                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Text(
                        "S0001-Indian Portfolio investment abroad - in equity shares",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Country Providing Services",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600),

                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Text(
                        "US",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
