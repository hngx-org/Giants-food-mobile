import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';
import 'package:giants_free_lunch/services/api_client.dart';

class SecondSignUpController extends GetxController {
  //SecondSignUpController();
  final companyNameController = TextEditingController();
  final lunchPriceController = TextEditingController();
  final box = GetStorage();

  validation() async {
    if (companyNameController.text.trim().isEmpty &&
        lunchPriceController.text.trim().isEmpty) {
      errorMethod("Company Name or Lunch Price can't empty");
    }
  }

  void signUp2() async {
    print("token ------ ${box.read("token")}");
    dynamic res = await ApiClient().postSignUp2(
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${box.read("token")}"
      },
      requestData: {
        "name": companyNameController.text.trim(),
        "lunch_price": lunchPriceController.text.trim(),
      },
    );

    print("----- $res");
    if (res == 400) {
      print("#### 400");
      errorMethod("Incorrect email or password");
    } else if (res["message"] == "success") {
      Get.offAll(HomePage());
    } else {
      errorMethod("An Error Occurred");
      // Map<String, dynamic> tokens = res['tokens'];
      // Get.offAll(HomePage());
    }
  }
}
