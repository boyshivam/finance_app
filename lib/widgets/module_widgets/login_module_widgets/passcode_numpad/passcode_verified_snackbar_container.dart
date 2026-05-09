import "package:aprreciate/core/constants/app_assets/app_assets_common.dart" show AppAssetsCommon;
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:flutter/material.dart";


class SnackbarContainer extends StatelessWidget {
  const SnackbarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: AppColorsCommon.snackBarMsgBlue
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AssetImageHelper.image(
            AppAssetsCommon.snackBarTick,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 30),
          Text(
              "Passcode verified successfully",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColorsCommon.appWhite,
                  fontWeight: FontWeight.w400
              )
          ),
        ],
      ),
    );
  }
}
