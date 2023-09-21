import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/app_export.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.headerText});
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        const Spacer(),
        Text(
          headerText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: appTheme.primaryColor,
            height: 2,
          ),
        ),
        const Spacer(),
        const SizedBox(
          width: 30,
        )
      ],
    );
  }
}
