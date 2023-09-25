import 'package:flutter/material.dart';
import '../controllers/reset_password.dart';
import '../core/app_export.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({
    super.key,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  // Initialize and register the ResetPasswordController
  final controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: appTheme.appBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Reset Password",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: appTheme.primaryColor,
            height: 2,
          ),
        ),
      ),
      body: ResetPasswordForm(
        controller: controller,
      ),
    );
  }
}

class ResetPasswordForm extends GetView<ResetPasswordController> {
  const ResetPasswordForm({super.key, required this.controller});

  @override
  final ResetPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            const Text(
              'Create a new Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            AppTextField(
              textController: controller.passWordController,
              obscureText: true,
              // decoration: const InputDecoration(),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              textTitle: 'Password',
              hintText: 'Password',
            ),
            const SizedBox(height: 20),
            AppTextField(
              textController: controller.confirmPassWordController,
              obscureText: true,
              // decoration: const InputDecoration(labelText: 'Confirm Password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != controller.passWordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              hintText: 'Password',
              textTitle: 'Confirm Passoword',
            ),
            const SizedBox(height: 20),
            AppButton(
              onPressed: () async {
                controller.validation();
                // if (controller.formKey.currentState!.validate()) {
                //   final password = controller.passWordController.text;
                //   // Call your registration API or perform the necessary logic here
                //   // For example:
                //   controller.resetPass1();
                // }
              },
              buttonText: 'Reset Password',
            )
          ],
        ),
      ),
    );
  }
}

resetPass3(String password) {}
