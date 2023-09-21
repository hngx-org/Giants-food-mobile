import 'package:flutter/material.dart';

class SignUpController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController confirmPassWordController = TextEditingController();
  bool obscurePassword = true;

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passWordController.dispose();
    confirmPassWordController.dispose();
  }
}
