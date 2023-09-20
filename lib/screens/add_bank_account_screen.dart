import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_bank_account_controller.dart' as addcontroller;
import '../widgets/custom_bottom_bar.dart';
import '../core/app_export.dart';

class AddBankAccountScreen extends StatelessWidget {
  final addcontroller.AddBankAccountController _controller =
      Get.put(addcontroller.AddBankAccountController());

  final Rx<BottomBarItem> selectedItem = BottomBarItem.Home.obs;

  AddBankAccountScreen({super.key});
  // {
  //   selectedItem.listen((item) {
  //     switch (item) {
  //       case BottomBarItem.Home:
  //         Get.offAll(() => HomePage()); // Navigate to the Home page
  //         break;
  //       case BottomBarItem.Leaderboards:
  //       //   Get.offAll(
  //       //       () => LeaderBoard()); // Navigate to the Leaderboards screen
  //         break;
  //       case BottomBarItem.Profile:
  //       //   Get.offAll(() => ProfilePage()); // Navigate to the Profile screen
  //         break;
  //     }
  //   });
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(CupertinoIcons.chevron_left),
        ),
        title: const Text(
          'Add Bank Account',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
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
              DropdownButtonFormField<String>(
                value: _controller.selectedCountry,
                onChanged: (newValue) {
                  _controller.updateSelectedCountry(newValue!);
                },
                items: _controller.countryList.map((String country) {
                  return DropdownMenuItem<String>(
                      value: country, child: Text(country));
                }).toList(),
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                  size: 16.0,
                  weight: 18.0,
                ),
                decoration: const InputDecoration(
                  hintText: 'Select Country',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(CupertinoIcons.globe),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _controller.selectedBank,
                onChanged: (newValue) {
                  _controller.updateSelectedBank(newValue!);
                },
                items: _controller.bankList.map((String bank) {
                  return DropdownMenuItem<String>(
                    value: bank,
                    child: Text(bank),
                  );
                }).toList(),
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                  size: 16.0,
                  weight: 18.0,
                ),
                decoration: const InputDecoration(
                  hintText: 'Select Bank',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  prefixIcon: Icon(CupertinoIcons.money_dollar_circle),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _controller.accountNumberController,
                decoration: const InputDecoration(
                  hintText: 'Account Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(CupertinoIcons.money_dollar),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF150D57),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () async {
                  // Add logic to add bank account here
                  final result = await _controller.addBankAccount();

                  if (result) {
                    // Show a success message using GetX SnackBar
                    Get.snackbar(
                      'Success',
                      'Bank account added successfully',
                      backgroundColor: Colors.green,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    // Show an error message using GetX SnackBar
                    Get.snackbar(
                      'Error',
                      'Failed to add bank account',
                      backgroundColor: Colors.red,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: const Text(
                  'Add Account',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedItem: selectedItem,
      ),
    );
  }
}
