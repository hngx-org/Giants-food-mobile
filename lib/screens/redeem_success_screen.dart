import 'package:flutter/material.dart';
import 'package:giants_free_lunch/widgets/app_success_display.dart';

import '../core/app_export.dart';

class RedeemSuccessScreen extends StatelessWidget {
  const RedeemSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.appBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const AppSuccessDisplay(displayText: '"You withdrew your lunch!"'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
            child: AppButton(
                buttonText: "Return Home",
                onPressed: () {
                  Get.to(() => HomePage());
                }),
          )
        ],
      ),
    );
  }
}
