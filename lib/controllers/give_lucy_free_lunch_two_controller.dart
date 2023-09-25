import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';
import 'package:giants_free_lunch/screens/success_screen.dart';
import 'package:giants_free_lunch/services/api_client.dart';

final apiClient = ApiClient();

class SendLunchController extends GetxController {
  final ApiClient apiClient = ApiClient();
  final complimentController = TextEditingController();
  GlobalKey<FormFieldState> lunchKey = GlobalKey();

  RxBool isDone = false.obs;

  String? errorMessage;
  @override
  void dispose() {
    super.dispose();
    complimentController.dispose();
  }

  validation({required String userId, required int numberOfLunch}) async {
    if (complimentController.text.trim().isEmpty) {
      errorMethod('Please enter compliment');
    } else {
      giveLunch(userId: userId, numberOfLunch: numberOfLunch);
    }
  }

  Future<void> giveLunch(
      {required String userId, required int numberOfLunch}) async {
    try {
      final requestData = {
        'receiver_id': userId,
        'quantity': numberOfLunch,
        'note': complimentController.text,
      };
      print(requestData);

      dynamic response =
          await ApiClient().sendLunch(requestData: requestData, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${box.read("token").toString()}"
      });
      print('he is here');
      print(response);
      if (response['message'] == "Lunch gifted successfully") {
        Get.off(SuccessScreen());
      } else {
        errorMethod("An Error occurred");
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }
}
