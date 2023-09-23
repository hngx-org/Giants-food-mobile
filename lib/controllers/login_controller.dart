import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';
import 'package:giants_free_lunch/services/api_client.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isObsecure = true.obs;
  GlobalKey<FormFieldState> formFieldKey = GlobalKey();
  String? errorMessage;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailController.clear();
    passwordController.clear();
  }

  validation() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      errorMethod('Email or Password can not be empty');
    } else if (!emailController.text.emailValidation) {
      errorMethod('Please enter a vaild email');
    } else {}
  }

  void login() async {
    final requestData = {
      'email': emailController.text,
      'password_hash': passwordController.text,
    };
    dynamic response = await ApiClient().postLogin(requestData: requestData);
    if (response) {}
  }
}
 // Get.offAll(HomePage());
      // try {
      //   final requestData = {
      //     'email': emailController.text,
      //     'password_hash': passwordController.text,
      //   };
      //   dynamic response =
      //       await ApiClient().postLogin(requestData: requestData);

      //   if (response == 200) {
      //     // Handle the response here
      //     // Example: Update UI based on the response data
      //     Get.offAll(HomePage());
      //   } else if (response == 400) {
      //     // Handle the case where the response is null or an error occurred
      //     errorMethod('User don\t exist');
      //   }
      // } catch (e) {
      //   // Handle exceptions or errors here
      //   print('Error1: $e');
      // }

     