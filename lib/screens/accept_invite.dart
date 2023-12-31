import 'package:flutter/material.dart';
import '../controllers/accept_invite_controller.dart';
import '../core/app_export.dart';

class AcceptInviteScreen extends StatefulWidget {
  AcceptInviteScreen({super.key,});
  

  @override
  State<AcceptInviteScreen> createState() => _AcceptInviteScreenState();
}

class _AcceptInviteScreenState extends State<AcceptInviteScreen> {
  // Initialize and register the AcceptInviteController
  final controller = Get.put(AcceptInviteController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: appTheme.appBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Accept Invite",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: appTheme.primaryColor,
            height: 2,
          ),
        ),
      ),
      body: AcceptInviteForm(
        controller: controller,
      ),
    );
  }
}

class AcceptInviteForm extends GetView<AcceptInviteController> {
  const AcceptInviteForm({super.key, required this.controller});

  @override
  final AcceptInviteController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            const Text(
              'Accept your invitation',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            AppTextField(
              textController: controller.firstNameController,
              // decoration: const InputDecoration(labelText: 'First Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
              hintText: 'First name',
              textTitle: 'First name',
            ),
            const SizedBox(height: 20),
            AppTextField(
              textController: controller.lastNameController,
              // decoration: const InputDecoration(labelText: 'Last Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
              textTitle: 'Last name',
              hintText: 'Last name',
            ),
            const SizedBox(height: 20),
            AppTextField(
              textController: controller.emailController,
              // decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return null;
                } else {
                  return "Please input a valid Email Address";
                }
              },
              textTitle: 'Email',
              hintText: 'Email',
            ),
            const SizedBox(height: 20),
            AppTextField(
              textController: controller.phoneController,
              // decoration: const InputDecoration(labelText: 'Phone Number'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              textTitle: 'Phone Number',
              hintText: 'Phone Number',
            ),
            const SizedBox(height: 20),
            AppTextField(
              textController: controller.passwordController,
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
              textController: controller.confirmPasswordController,
              obscureText: true,
              // decoration: const InputDecoration(labelText: 'Confirm Password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != controller.passwordController.text) {
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
                //   if (controller.formKey.currentState!.validate()) {
                //     final firstName = controller.firstNameController.text;
                //     final lastName = controller.lastNameController.text;
                //     final email = controller.emailController.text;
                //     final phoneNumber = controller.phoneController.text;
                //     final password = controller.passwordController.text;
                //     // Call your registration API or perform the necessary logic here
                //     // For example:
                //     final success = await registerUser(
                //       firstName,
                //       lastName,
                //       email,
                //       phoneNumber,
                //       password,
                //     );

                //     if (success) {
                //       // Registration successful, navigate to another screen or perform actions
                //     } else {
                //       // Registration failed, handle the error (e.g., display an error message)
                //     }
                //   }
                // final invitationAcceptance = InvitationAcceptance(
                //   firstName: firstName,
                //   lastName: lastName,
                //   email: email,
                //   phoneNumber: phoneNumber,
                //   password: password,
                // Set values for any additional invitation-related fields here
                // );

                // // Call your API to accept the invitation
                // // final success = await acceptInvitation(invitationAcceptance);

                // if (success) {
                //   // Invitation accepted successfully, navigate to another screen or perform actions
                // } else {
                //   // Invitation acceptance failed, handle the error (e.g., display an error message)
                // }
                // }
              },
              buttonText: 'Accept Invite',
            )
          ],
        ),
      ),
    );
  }
  
  InvitationAcceptance({required String firstName, required String lastName, required String email, required String phoneNumber, required String password}) {}
}

registerUser(String firstName, String lastName, String email,
    String phoneNumber, String password) {}
