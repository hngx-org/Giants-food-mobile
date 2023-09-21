import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.textTitle,
    required this.textController,
    this.onChanged,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
  });
  final String textTitle;
  final TextEditingController textController;
  final Function(String)? onChanged;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;

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
            height: 2,
          ),
        ),
        SizedBox(
          height: 45,
          width: double.infinity,
          child: TextField(
            obscureText: obscureText,
            controller: textController,
            onChanged: onChanged,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 1,
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
