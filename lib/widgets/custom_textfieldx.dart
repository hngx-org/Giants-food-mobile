import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/app_export.dart';

class InputField extends StatefulWidget {
  final String hint;
  final String title;
  final TextEditingController? controller;
  final Widget? icon;
  final bool isObsured;
  final FormFieldValidator<String>? validate;
  final String? errorText;

  const InputField({
    super.key,
    required this.hint,
    required this.title,
    this.controller,
    this.icon,
    this.isObsured = false,
    this.validate,
    this.errorText,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String? _errorText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: titleStyle,
          ),
          Container(
            height: 45.h,
            margin: const EdgeInsets.only(top: 2),
            padding: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    autofocus: false,
                    controller: widget.controller,
                    style: subtitleStyle,
                    obscureText: widget.isObsured,
                    validator: widget.validate,
                    onChanged: (value) {
                      setState(() {
                        _errorText = widget.validate != null
                            ? widget.validate!(value)
                            : null;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: widget.hint,
                      hintStyle: subtitleStyle,
                      suffixIcon: widget.icon,
                      errorText: _errorText,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      focusedErrorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle get subtitleStyle {
  return const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
}

TextStyle get titleStyle {
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}