// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontsize;
  final bool isBold;
  final Color? color;
  final bool isAligned;

  const CustomText({
    Key? key,
    required this.text,
    this.fontsize = 15,
    this.isBold = false,
    this.color,
    this.isAligned = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: isAligned ? TextAlign.center : null,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}