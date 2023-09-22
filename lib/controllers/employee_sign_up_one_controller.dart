import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';
 
  class SignUpController extends GetxController{
    final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController confirmPassWordController =
      TextEditingController();
  bool obscurePassword = true;


    

  validation() async {
    if (emailController.text.trim().isEmpty ||
        passWordController.text.trim().isEmpty ||
        firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty ||
        phoneNumberController.text.trim().isEmpty) {
      errorMethod('Email or Password can not be empty');
    } else if (!emailController.text.emailValidation) {
      errorMethod('Please enter a vaild email');
    } else if (passWordController.text.trim() ==
        confirmPassWordController.text.trim()) {
      errorMethod('password and confirm is not the same');
    } else {}
  }
  }

