import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAccountController extends GetxController {
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();

  // Add any other necessary logic for account creation here

  @override
  void onClose() {
    // Clean up your controllers when the screen is closed to avoid memory leaks
    accountNameController.dispose();
    accountNumberController.dispose();
    super.onClose();
  }
}
class AddAccountScreen extends StatelessWidget {
   AddAccountScreen({super.key});

  final AddAccountController controller = Get.put(AddAccountController());
   
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

