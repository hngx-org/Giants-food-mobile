import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorMethod(String erorrMsg) {
  return Get.snackbar(
    backgroundColor: Colors.red,
    colorText: Colors.white,
    "Error Occured",
    erorrMsg,
  );
}

extension ExtString on String {
  bool get emailValidation {
    final emailIsValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailIsValid.hasMatch(this);
  }
}

extension ExString on String {
  bool get passwordValidation {
    final passwordIsVaild =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}$');
    return passwordIsVaild.hasMatch(this);
  }
}
