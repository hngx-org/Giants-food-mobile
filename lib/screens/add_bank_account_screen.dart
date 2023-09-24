import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../controllers/add_bank_account_controller.dart' as addcontroller;
import '../core/app_export.dart';

class AddBankAccountScreen extends StatelessWidget {
  final addcontroller.AddBankAccountController _controller =
      Get.put(addcontroller.AddBankAccountController());

  final Rx<BottomBarItem> selectedItem = BottomBarItem.Home.obs;

  // Listen to changes in selected item and navigate accordingly
  AddBankAccountScreen({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.appBackgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
        title: Text(
          'Add Bank Account',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: appTheme.primaryColor,
            height: 2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ContentWidget(controller: _controller),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
    required addcontroller.AddBankAccountController controller,
  }) : _controller = controller;

  final addcontroller.AddBankAccountController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Securely link your bank account',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 45,
            child: DropdownButtonFormField<String>(
              dropdownColor: appTheme.appBackgroundColor,
              isExpanded: true,
              value: _controller.selectedCountry,
              onChanged: (newValue) {
                _controller.updateSelectedCountry(newValue!);
              },
              items: _controller.countryList.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(
                    country,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                );
              }).toList(),
              icon: const Icon(
                CupertinoIcons.chevron_down,
                size: 14.0,
                weight: 18.0,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(right: 10),
                hintText: 'Select Country',
                hintStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                prefixIcon: const Icon(CupertinoIcons.globe),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 45,
            child: DropdownButtonFormField<String>(
              dropdownColor: appTheme.appBackgroundColor,
              value: _controller.selectedBank,
              onChanged: (newValue) {
                _controller.updateSelectedBank(newValue!);
              },
              items: _controller.bankList.map((String bank) {
                return DropdownMenuItem<String>(
                  value: bank,
                  child: Text(
                    bank,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
              icon: const Icon(
                CupertinoIcons.chevron_down,
                size: 16.0,
                weight: 18.0,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(right: 10),
                hintText: 'Select Bank',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(CupertinoIcons.money_dollar_circle),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 45,
            child: TextFormField(
              controller: _controller.accountNumberController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(right: 10),
                hintText: 'Account Number',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                prefixIcon: const Icon(CupertinoIcons.money_dollar),
              ),
            ),
          ),
          const SizedBox(height: 50),
          AppButton(
            buttonText: 'Add Account',
            onPressed: () async {
              _controller.addBankAccount(userID: 1);
              Get.back();

              // Add logic to add bank account here
              //final result = await _controller.addBankAccount();

              // if (result) {
              //   // Show a success message using GetX SnackBar
              //   Get.snackbar(
              //     'Success',
              //     'Bank account added successfully',
              //     backgroundColor: Colors.green,
              //     snackPosition: SnackPosition.BOTTOM,
              //   );
              // } else {
              //   // Show an error message using GetX SnackBar
              //   Get.snackbar(
              //     'Error',
              //     'Failed to add bank account',
              //     backgroundColor: Colors.red,
              //     snackPosition: SnackPosition.BOTTOM,
              //   );
              // }
            },
          ),
        ],
      ),
    );
  }
}
