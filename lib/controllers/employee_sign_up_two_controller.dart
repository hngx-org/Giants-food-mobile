import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondSignUpController extends GetxController {
  //SecondSignUpController();
  final companyNameController = TextEditingController();
  final lunchPriceController = TextEditingController();

  validation() async {
    if (companyNameController.text.trim().isEmpty &&
        lunchPriceController.text.trim().isEmpty) {
      Get.snackbar(
          colorText: Colors.red,
          "Error Occured",
          "Company Name or Lunch Price can't empty");
    }
  }
}
