import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/constants/app_assets/app_strings.dart";
import "package:aprreciate/core/themes/app_theme/app_theme.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:aprreciate/widgets/helper_widgets/size_config.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

const Color sub_text_Container = Color(0xFFE1ECFC);
const Color colorContainer = Color(0xFFE1ECFC);
const Color mNumTextColor = Colors.black54;
const Color textFieldBGColor = Colors.white;
const Color defaultColor = theColor;

class MobileNumValidator extends StatefulWidget {
  const MobileNumValidator({
    super.key,
    required this.onController,
    required this.errorString,
    required this.borderColor,
    required this.onChanged,
  });

  final TextEditingController onController;
  final String? errorString;
  final Color borderColor;
  final void Function(String value) onChanged;

  @override
  State<MobileNumValidator> createState() => _MNumValidatorState();
}

class _MNumValidatorState extends State<MobileNumValidator> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // this is the info text container
        Container(
          height: 176,
          width: SizeConfig.width(context) * 0.87,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: sub_text_Container,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AssetImageHelper.image(
                    AppAssets.lo_speaker,
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      AppStrings.log_subt2,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // this the number input  textfield
        Positioned(
          bottom: 60,
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            height: 120,
            width: SizeConfig.width(context) * 0.87,
            decoration: BoxDecoration(
              color: textFieldBGColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: widget.borderColor, width: 2.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.log_mob_label,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                TextField(
                  maxLength: 10,
                  maxLines: 1,
                  enabled: true,
                  controller: widget.onController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    widget.onChanged(value);
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 4, top: 4),
                      child: Text(
                        "+91",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
                if (widget.errorString != null)...[
                  Text(
                    widget.errorString!,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: Colors.red),
                  ),
                ]

              ],
            ),
          ),
        ),
      ],
    );
  }
}
