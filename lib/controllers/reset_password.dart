import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';
import 'package:giants_free_lunch/services/api_client.dart';
import '../core/app_export.dart';
import 'screens/login_screen.dart';


final apiClient = ApiClient();


class ResetPasswordController extends GetxController {
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController confirmPassWordController = TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  final formKey = GlobalKey<FormState>();
  // final box = GetStorage();

  @override
  void dispose() {
    super.dispose();
    passWordController.dispose();
    confirmPassWordController.dispose();
  }

  validation() async {
    if (passWordController.text.passwordValidation) {
      errorMethod("Please enter a strong password");
    } else if (passWordController.text.trim() !=
        confirmPassWordController.text.trim()) {
      errorMethod('password and confirm is not the same');
    } else {
      resetPass1();
    }
  }

  void resetPass1() async {
    dynamic res = await ApiClient().postResetPass1(
      requestData: {
        "password_hash": passWordController.text.trim(),
        "token": "${box.read("resetPassToken")}",
      },
      headers: {
        authorization: "Bearer ${box.read("token")}"
      }
    );

    print("----- $res");
    if (res == 400) {
      print("#### 400");
      errorMethod("There was an error");
    } else{
      
      Get.offAll(SignIn());
    }
  }
}
