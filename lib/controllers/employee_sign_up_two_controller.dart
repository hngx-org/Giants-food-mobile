import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';

class SecondSignUpController extends GetxController {
  //SecondSignUpController();
  final companyNameController = TextEditingController();
  final lunchPriceController = TextEditingController();

  validation() async {
    if (companyNameController.text.trim().isEmpty &&
        lunchPriceController.text.trim().isEmpty) {
      errorMethod("Company Name or Lunch Price can't empty");
    }
  }
}
