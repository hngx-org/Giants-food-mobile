import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';
import 'package:giants_free_lunch/screens/employee_sign_up_two_screen.dart';
import 'package:giants_free_lunch/services/api_client.dart';
import '../core/app_export.dart';

class SignUpController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController confirmPassWordController =
      TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  // final box = GetStorage();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passWordController.dispose();
    confirmPassWordController.dispose();
  }

  validation() async {
    if (emailController.text.trim().isEmpty ||
        passWordController.text.trim().isEmpty ||
        firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty ||
        phoneNumberController.text.trim().isEmpty) {
      errorMethod('Email or Password can not be empty');
    } else if (!emailController.text.emailValidation) {
      errorMethod('Please enter a vaild email');
    } else if (phoneNumberController.text.isPhoneNumber == false) {
      errorMethod("Please enter a valide phone number");
    } else if (passWordController.text.passwordValidation) {
      errorMethod("Please enter a strong password");
    } else if (passWordController.text.trim() !=
        confirmPassWordController.text.trim()) {
      errorMethod('password and confirm is not the same');
    } else {
      signUp1();
    }
  }

  void signUp1() async {
    dynamic res = await ApiClient().postSignUp1(
      requestData: {
        "email": emailController.text.trim(),
        "first_name": firstNameController.text.trim(),
        "last_name": lastNameController.text.trim(),
        "phone": phoneNumberController.text.trim(),
        "password_hash": passWordController.text.trim()
      },
    );

    print("----- $res");
    if (res == 400) {
      print("#### 400");
      errorMethod("Incorrect email or password");
    } else if (res["user"]["email"] == emailController.text.trim()) {
      box.write("token", res["tokens"]["refresh"]["token"]);
      print("token ------ ${box.read("token")}");
      Get.offAll(SecondSignUp());
    } else {
      errorMethod("An Error Occurred");
    }
  }
}
