import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';
import 'package:giants_free_lunch/screens/login_screen.dart';
import 'package:giants_free_lunch/services/api_client.dart';

import '../core/app_export.dart';

class AddBankAccountController extends GetxController {
  // Initialize with the default selected item
  final List<String> countryList = ['Nigeria', 'Ghana', 'India'];
  final List<String> bankList = ['Zenith Bank', 'UBA', 'GT Bank'];
  String selectedCountry = 'Nigeria';
  String selectedBank = 'Zenith Bank';
  final TextEditingController accountNumberController = TextEditingController();

  void updateSelectedCountry(String newValue) {
    selectedCountry = newValue;
    update();
  }

  void updateSelectedBank(String newValue) {
    selectedBank = newValue;
    update();
  }

  Future<void> addBankAccount({required int userID}) async {
    final selectedCountry = this.selectedCountry;
    final selectedBank = this.selectedBank;
    final accountNumber = accountNumberController.text.trim();

    if (accountNumber.isEmpty) {
      errorMethod('Email or Password can not be empty');
    } else {
      dynamic res = await ApiClient().addAccount(
          userId: userID,
          headers: box.read("token"),
          requestData: {
            "bank_name": selectedBank,
            "bank_number": accountNumber,
            "bank_code": "056"
          });

      print("------ $res");
      if (res == 400) {
        print('#### 400');
        errorMethod("Incorrect email or password");
      } else if (res == 200) {
        Get.offAll(const SignIn());
      } else {
        errorMethod("An Error Occured");
      }
    }
  }

  @override
  void onClose() {
    accountNumberController.dispose();
    super.onClose();
  }
}
