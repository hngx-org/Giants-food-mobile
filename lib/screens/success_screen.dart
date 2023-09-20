import 'package:flutter/material.dart';
import 'package:giants_free_lunch/main.dart';
import 'package:giants_free_lunch/widgets/app_custom_buttons.dart';
import 'package:giants_free_lunch/widgets/app_success_display.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.appBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const AppSuccessDisplay(displayText: '"You' "'" "ve just made Lucy'" 's day!"'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
            child: AppButton(buttonText: "Return Home", onPressed: (){}),
          )
        ],
      ),
    );
  }
}
