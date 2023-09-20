import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_bank_account_controller.dart' as addcontroller ;
import '../widgets/custom_bottom_bar.dart';


class AddBankAccountScreen extends StatelessWidget {
  final addcontroller.AddBankAccountController _controller = Get.put(addcontroller.AddBankAccountController());

final Rx<BottomBarItem> selectedItem = BottomBarItem.Home.obs;
  
   AddBankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bank Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: _controller.selectedCountry,
              onChanged: (newValue) {
                _controller.updateSelectedCountry(newValue!);
              },
              items: _controller.countryList.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Select Country'),
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
              decoration: const InputDecoration(labelText: 'Select Bank'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _controller.accountNumberController,
              decoration: const InputDecoration(labelText: 'Account Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
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
              child: const Text('Add Bank Account'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedItem: selectedItem,
      ),
    );
  }
}
