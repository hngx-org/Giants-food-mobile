import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddBankAccountController extends GetxController {// Initialize with the default selected item
  final List<String> countryList = ['Country 1', 'Country 2', 'Country 3'];
  final List<String> bankList = ['Bank 1', 'Bank 2', 'Bank 3'];
  String selectedCountry = 'Country 1';
  String selectedBank = 'Bank 1';
  final TextEditingController accountNumberController = TextEditingController();

  void updateSelectedCountry(String newValue) {
    selectedCountry = newValue;
    update();
  }

  void updateSelectedBank(String newValue) {
    selectedBank = newValue;
    update();
  }

  Future<bool> addBankAccount() async {
    final selectedCountry = this.selectedCountry;
    final selectedBank = this.selectedBank;
    final accountNumber = accountNumberController.text;

    // Add your bank account addition logic here
    // You can return true for success and false for failure
    bool success = false; // Replace with your actual logic

    return success;
  }

  @override
  void onClose() {
    accountNumberController.dispose();
    super.onClose();
  }
}