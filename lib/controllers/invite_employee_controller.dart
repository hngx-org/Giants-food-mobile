import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';
import 'package:giants_free_lunch/services/api_client.dart';

class InviteController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  validation() async {
    if (emailController.text.isEmail == false) {
      errorMethod("Input a valid email");
    } else {
      inviteEmployee();
    }
  }

  void inviteEmployee() async {
    print("------------ ${box.read("token")}");
    dynamic res = await ApiClient().postOrganizationInvite(
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${box.read("token")}"
      },
      requestData: {"email": emailController.text.trim()},
    );

    print("----- ${res["message"]}");
    if (res["message"] == "User invited succesfully") {
      print("true");

      Get.back();
      successMethod("User invited succesfully");
    } else {
      errorMethod("An Error Occurred");
      // Map<String, dynamic> tokens = res['tokens'];
      // Get.offAll(HomePage());
    }
  }
}
