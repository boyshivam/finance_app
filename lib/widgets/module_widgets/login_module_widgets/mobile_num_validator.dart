import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/constants/app_assets/app_strings.dart";
import "package:flutter/material.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:flutter/services.dart";


const Color colorSTContainer = Color(0xFFE1ECFC);
const Color colorContainer = Color(0xFFE1ECFC);
const Color mNumTextColor = Colors.black54;
const Color textFieldBGColor = Colors.white;

class MobileNumValidator extends StatefulWidget {
  const MobileNumValidator({super.key, required this.formKey, required this.onSaved});


  final GlobalKey<FormState> formKey;
  final void Function(String?) onSaved;

  @override
  State<MobileNumValidator> createState() => _MNumValidatorState();
}


class _MNumValidatorState extends State<MobileNumValidator> {

  final List<String> wrongNumbers = ['0', '1','2', '3', '4', '5', '6', ];

  bool validateNum(String number) {
    final String  firstNumber = number[0];

    if (wrongNumbers.contains(firstNumber)){
      return false;
    }
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: ,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10)
            ],
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(

                contentPadding: EdgeInsets.fromLTRB(15, 45, 15, 15),
                prefixText: "+91  ",
                filled: true,
                fillColor: textFieldBGColor
              //   borderSide: BorderSide(color: theColor)
            ),
            validator: (value) {
              if(value == null || value.isEmpty) {
                return "Cannot be empty";
              } else if (value.length < 10) {
                return "Enter a 10 digit number";
              } else if (wrongNumbers.contains(value[0])){
                return "Invalid number";
              }
              return null;

            },
            onSaved: widget.onSaved,
          ),
          Container(
            height: 80,
            padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              color: colorContainer,
            ),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AssetImageHelper.image(
                      AppAssets.lo_speaker,
                      width: 15,
                      height: 15,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        AppStrings.log_subt2,
                        maxLines: 2,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                            fontSize: 15
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
