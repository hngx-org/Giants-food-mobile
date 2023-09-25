import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';
import 'package:giants_free_lunch/services/api_client.dart';

final apiClient = ApiClient();

class SignInController extends GetxController {
  final ApiClient apiClient = ApiClient();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isObsecure = true.obs;

  // RxString firstName = ''.obs;
  // RxString email = ''.obs;
  // RxString accessToken = ''.obs;
  // RxString lunchBal = ''.obs;
  // RxString companyName = ''.obs;
  // RxString userid = ''.obs;
  RxBool isLoggedIn = false.obs;
  GlobalKey<FormFieldState> formFieldKey = GlobalKey();

  String? errorMessage;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailController.clear();
    passwordController.clear();
  }

  validation() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      errorMethod('Email or Password can not be empty');
    } else if (!emailController.text.emailValidation) {
      errorMethod('Please enter a vaild email');
    } else {
      login();
    }
  }

  Future<void> login() async {
    try {
      //final headers = {'Authorization': 'I dont have'};
      print("got here");
      final requestData = {
        'email': emailController.text,
        'password_hash': passwordController.text,
      };
      dynamic response = await ApiClient().postLogin(requestData: requestData);
      print("---------- response $response");
      if (response["user"]!["email"] == emailController.text.trim()) {
        print('Logged in as ${response["user"]["first_name"]}');
        // Update the observables
        // firstName.value = response["user"]["first_name"] ?? '';
        // userid.value = response["user"]["id"] ?? '';
        // email.value = response["user"]["email"] ?? '';
        // accessToken.value = response["tokens"]["refresh"]["token"] ?? '';
        // companyName.value = response["user"]['organization']["name"] ?? '';
        // lunchBal.value = response["user"]["lunch_credit_balance"] ?? '';

        print('token: --------- ${response["tokens"]["refresh"]["token"]}');

        isLoggedIn.value = true;

        // Save data to GetStorage

        box.write('firstName', response["user"]["first_name"]);
        box.write("lastName", response["user"]["last_name"]);
        box.write('email', response["user"]["email"]);
        box.write('token', response["tokens"]["access"]["token"]);
        box.write('refreshToken', response["tokens"]["refresh"]["token"]);
        // box.write(
        //     'companyName', response["user"]['organization']["name"] ?? "");
        box.write('userID', response["user"]["id"]);
        box.write('lunchBal', response["user"]["lunch_credit_balance"]);

        print('Box ${box.read('token')}');

        emailController.clear();
        passwordController.clear();

        Get.off(HomePage());
      } else {
        print('fetching failed: $response');
        errorMethod('Email or Password Incorrect');
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }
}
