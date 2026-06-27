import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class EnterAmountContainer extends StatelessWidget {
  const EnterAmountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColorsCommon.appWhite,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Enter transfer amount", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 24,
                color: AppColorsCommon.textGrey
              )),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefix:Text(" \$   ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),) ,

                contentPadding: EdgeInsets.symmetric(
                  vertical: 20, horizontal: 0
                ),
                border: InputBorder.none,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColorsCommon.lightBlueBackground,
                    width: 2,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColorsCommon.appreciateThemeColor,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.compare_arrows, size: 20),
                    const SizedBox(width: 5),
                    Text("\$114.7"),
                    const SizedBox(width: 3),
                    Text(
                      "(\$1 = Rs 83.41)",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColorsCommon.textGrey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text("In USD"),
              ],
            ),
            const Divider(
              color: AppColorsCommon.inactiveTextFieldBorderColor,
              thickness: 3,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.timelapse, size: 20),
                    const SizedBox(width: 5),
                    Text("Tomorrow"),
                    const SizedBox(width: 3),
                  ],
                ),
                const Spacer(),
                Text("Processing Date"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
