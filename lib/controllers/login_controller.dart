import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/app_export.dart';

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
    }
  }

  SnackbarController errorMethod(String erorrMsg) {
    return Get.snackbar(
      backgroundColor: Colors.red,
      colorText: Colors.white,
      "Error Occured",
      erorrMsg,
    );
  }
}

extension ExtString on String {
  bool get emailValidation {
    final emailIsValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailIsValid.hasMatch(this);
  }

  bool get passwordValidation {
    final passwordIsVaild =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}$');
    return passwordIsVaild.hasMatch(this);
  }
}
