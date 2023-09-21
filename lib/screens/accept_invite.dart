import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/accept_invite_controller.dart';
import '../core/app_export.dart';

class AcceptInviteScreen extends StatelessWidget {
  // Initialize and register the AcceptInviteController
  final controller = Get.put(AcceptInviteController());

  AcceptInviteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accept Invite'),
      ),
      body: AcceptInviteForm(
        controller: controller,
      ),
    );
  }
}

class AcceptInviteForm extends GetView<AcceptInviteController> {
  const AcceptInviteForm({super.key, required this.controller});

  final AcceptInviteController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: controller.firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != controller.passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            AppButton(
              onPressed: () async {
                if (controller.formKey.currentState!.validate()) {
                  final firstName = controller.firstNameController.text;
                  final lastName = controller.lastNameController.text;
                  final email = controller.emailController.text;
                  final phoneNumber = controller.phoneController.text;
                  final password = controller.passwordController.text;

                  // Call your registration API or perform the necessary logic here
                  // For example:
                  final success = await registerUser(
                    firstName,
                    lastName,
                    email,
                    phoneNumber,
                    password,
                  );

                  if (success) {
                    // Registration successful, navigate to another screen or perform actions
                  } else {
                    // Registration failed, handle the error (e.g., display an error message)
                  }
                }
              },
              buttonText: 'Accept Invite',
            )
          ],
        ),
      ),
    );
  }
}

registerUser(String firstName, String lastName, String email, String phoneNumber, String password) {
}
