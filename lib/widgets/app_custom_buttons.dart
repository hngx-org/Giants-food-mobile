import 'package:flutter/material.dart';
import '../core/app_export.dart';

final appTheme = AppTheme();

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.buttonWidth = double.infinity});
  final String buttonText;
  final Function() onPressed;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            appTheme.primaryColor,
          ),
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 16,
              color: appTheme.appButtonTextColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
