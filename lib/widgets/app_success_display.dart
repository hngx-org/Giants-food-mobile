import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/utils/image_constant.dart';

class AppSuccessDisplay extends StatelessWidget {
  const AppSuccessDisplay({super.key, required this.displayText});
  final String displayText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          ImageConstant.imgYay,
          height: 250,
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              ImageConstant.imgTrash
            ),
          ],
        ),
      ],
    );
  }
}