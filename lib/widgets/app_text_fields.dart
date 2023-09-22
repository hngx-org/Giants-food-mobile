import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.textTitle,
    required this.textController,
    this.onChanged,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    required InputDecoration decoration,
    String? Function(dynamic value)? validator,
    this.keyBoardType,
    this.inputFormatter,
  });
  final String textTitle;
  final TextEditingController textController;
  final Function(String)? onChanged;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyBoardType;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textTitle,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            height: 2.0,
            color: Color(0xff000000),
          ),
        ),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: TextField(
            obscureText: obscureText,
            controller: textController,
            onChanged: onChanged,
            keyboardType: keyBoardType,
            inputFormatters: inputFormatter,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Color(0xFF323232),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
