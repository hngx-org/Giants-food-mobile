import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';
import 'package:giants_free_lunch/screens/accept_invite.dart';
import 'package:giants_free_lunch/screens/login_screen.dart';
import 'package:giants_free_lunch/services/api_client.dart';

import '../core/app_export.dart';

class AcceptInviteController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  validation() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      errorMethod('Email or Password can not be empty');
    } else if (!emailController.text.emailValidation) {
      errorMethod('Please enter a vaild email');
    } else if (phoneController.text.isPhoneNumber == false) {
      errorMethod("Please enter a valide phone number");
    } else if (passwordController.text.passwordValidation) {
      errorMethod("Please enter a strong password");
    } else if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      errorMethod('password and confirm is not the same');
    } else {
      acceptInvite();
    }
  }

  void hasAnAccount() async {
    print("token ------ ${box.read("token")}");
    dynamic res = await ApiClient().acceptInvite(
      requestData: {
        "token": box.read("inviteToken") ?? "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOnsiaWQiOjg0NDg3NzQ5LCJlbWFpbCI6InVtdW51Ym8ubGdAZ21haWwuY29tIn0sImlhdCI6MTY5NTU4NzQ4NSwiZXhwIjoxNjk1NjczODg1LCJ0eXBlIjoib3JnYW5pemF0aW9uSW52aXRlIn0.kZBI0X9ydzfUI1WGi3dZlRn_LDCE1I7Eh6i_t66tsdw"
        // ,
      },
    );

    print("----- $res");
    if (res["isUser"] == false) { 
      box.write("org_id", res["org_id"]);
      Get.offAll(AcceptInviteScreen());
    } else if (res["isUser"] == true) {
      box.write("org_id", res["org_id"]);
      Get.offAll(const SignIn());
    } else {
      errorMethod("An Error Occurred");
    }
  }

  void acceptInvite() async {
    print("token ------ ${box.read("token")}");
    dynamic res = await ApiClient().postSignUp1(
      requestData: {
        "email": emailController.text.trim(),
        "first_name": firstNameController.text.trim(),
        "last_name": lastNameController.text.trim(),
        "phone": phoneController.text.trim(),
        "password_hash": passwordController.text.trim(),
        "org_id": box.read("org_id") ?? "15"
      },
    );
    print("----- accept invite $res");
    if (res == 400) {
      print("#### 400");
      errorMethod("Incorrect email or password");
    } else if (res["user"]["email"] == emailController.text.trim()) {

      box.write('firstName', res["user"]["first_name"]);
      box.write('email', res["user"]["email"]);
      box.write("token", res["tokens"]["refresh"]["token"]);

      print("token ------ ${box.read("token")}");
      Get.offAll(HomePage());
    } else {
      errorMethod("An Error Occurred");
    }
  }
}
