import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giants_free_lunch/core/app_export.dart';

errorMethod(String erorrMsg) {
  return Get.snackbar(
    backgroundColor: Colors.red,
    colorText: Colors.white,
    "Error Occured",
    erorrMsg,
  );
}
successMethod(String successmsg) {
  return Get.snackbar(
    backgroundColor: appTheme.primaryColor,
    colorText: Colors.white,
    "Success",
    successmsg,
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
