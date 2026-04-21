import "package:aprreciate/core/constants/app_assets/app_strings.dart";
import "package:aprreciate/widgets/helper_widgets/custom_elevated_button.dart";
import "package:aprreciate/widgets/helper_widgets/size_config.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

const Color passcodeBlue = Color(0xFFE1ECFC);
const Color passcodeWhite = Colors.white;


class PasscodeValidator extends StatefulWidget {
  const PasscodeValidator({super.key});

  @override
  State<PasscodeValidator> createState() => _PasscodeValidatorState();
}

class _PasscodeValidatorState extends State<PasscodeValidator> {


  // this is the pass code legth
  final passcodeLength = 4;


  // declaring the controller and focus nodes
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;


  // initialize the controllers
  @override
  void initState() {
    controllers = List.generate(passcodeLength, (_) => TextEditingController());
    focusNodes = List.generate(passcodeLength, (_) => FocusNode());
    super.initState();
  }


  // dispose the controllers
  @override
  void dispose(){

    // dispose controller
    for(var c in controllers){
      c.dispose();
    }

    // dispose focus nodes
    for(var f in focusNodes){
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SizeConfig.height(context) * 0.11, width: SizeConfig.width(context) * 0.86,
          decoration: BoxDecoration(
            color: passcodeWhite,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2
            ),
          ),

          // Inside the container for the text and circles
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(AppStrings.passcode_enter_pass, style: Theme.of(context).textTheme.bodySmall,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(passcodeLength, (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.width(context)*0.02),
                  child: Container(
                    width: SizeConfig.width(context) * 0.05, // ratio of with of each circle in the passcode
                    height: SizeConfig.width(context) * 0.05,
                    decoration: BoxDecoration(
                      color: passcodeBlue,
                      borderRadius: BorderRadius.circular(SizeConfig.width(context) * 0.06),
                    ),
                    child: TextField(
                      maxLength: 1,
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 0
                      ),
                      cursorColor: Colors.transparent,
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: "",
                        isCollapsed: true
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value){
                        if(value.isNotEmpty && index < passcodeLength - 1){
                          focusNodes[index + 1].requestFocus();
                        } else if (value.isEmpty && index > 0){
                          focusNodes[index - 1].requestFocus();

                        }
                      },
                    ),
                  ),
                ))
              ),
            ],
          )
        ),
      ],
    );
  }
}
