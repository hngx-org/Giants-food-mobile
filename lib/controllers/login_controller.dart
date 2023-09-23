import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';
import 'package:giants_free_lunch/models/app_model.dart';
import 'package:giants_free_lunch/services/api_client.dart';

final apiClient = ApiClient();

class SignInController extends GetxController {
  final ApiClient apiClient = ApiClient();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isObsecure = true.obs;

  RxString firstName = ''.obs;
  RxString email = ''.obs;
  RxString accessToken = ''.obs;
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
      final requestData = {
        'email': emailController.text,
        'password_hash': passwordController.text,
      };
      dynamic response = await ApiClient().postLogin(requestData: requestData);
      if (response is UserModel) {
        print('Logged in as ${response.user?.firstName}');
        // Update the observables
        firstName.value = response.user?.firstName ?? '';
        email.value = response.user?.email ?? '';
        accessToken.value = response.tokens?.access?.token ?? '';

        // Save data to GetStorage
        final box = GetStorage();
        box.write('firstName', firstName.value);
        box.write('email', email.value);
        box.write('accessToken', accessToken.value);

        Get.off(HomePage());
      } else {
        print('Login failed: $response');
        errorMethod('Email or Password Incorrect');
      }
    } catch (e) {
      print('Error during login: $e');
      //CircularProgressIndicator.adaptive();
      // login();
    }
  }

//     final passwordIsVaild =
//         RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}$');
//     return passwordIsVaild.hasMatch(this);
//   }
// }
}
