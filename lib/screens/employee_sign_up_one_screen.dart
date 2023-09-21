import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giants_free_lunch/controllers/employee_sign_up_one_controller.dart';
import 'package:giants_free_lunch/core/app_export.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, required String title});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final InviteController inviteController = Get.put(InviteController());

  @override
  void dispose() {
    inviteController.dispose(); // Corrected the controller name
    super.dispose();
  }

  Container buildPasswordTextField(
      bool obscure, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color(0xFF8A8A8A),
          width: 1.0,
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Password',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 11),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                inviteController.obscurePassword = !inviteController
                    .obscurePassword; // Corrected the controller name
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                inviteController.obscurePassword
                    ? Icons.visibility
                    : Icons.visibility_off, // Corrected the controller name
                color: Colors.grey,
                size: 19,
              ),
            ),
          ),
        ),
        obscureText:
            inviteController.obscurePassword, // Corrected the controller name
      ),
    );
  }

  final appTheme = AppTheme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 109,
                  right: 109,
                  top: 80,
                ),
                child: Container(
                  width: 157,
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF150D57), Color(0xFFE6E6E6)],
                      stops: [0.5, 0.5],
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 58.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                          fontFamily: 'Inter',
                          height: 1.56),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Text(
                    'Let\'s get started! Sign up with \n your email below.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      height: 1.56,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 38.0),
                  const Text(
                    'First name',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      color: Color(0xff000000),
                      height: 2.0,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: const Color(0xFF8A8A8A),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: inviteController
                          .firstNameController, // Corrected the controller name
                      decoration: const InputDecoration(
                        hintText: 'First name',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 11),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  const Text(
                    'Last name',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'inter',
                      fontStyle: FontStyle.normal,
                      height: 2.0,
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: const Color(0xFF8A8A8A),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: inviteController
                          .lastNameController, // Corrected the controller name
                      decoration: const InputDecoration(
                        hintText: 'Last name',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 11),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'inter',
                      fontStyle: FontStyle.normal,
                      height: 2.0,
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: const Color(0xFF8A8A8A),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: inviteController
                          .emailController, // Corrected the controller name
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 11),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  const Text(
                    'Phone number',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'inter',
                      fontStyle: FontStyle.normal,
                      height: 2.0,
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: const Color(0xFF8A8A8A),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: inviteController
                          .phoneNumberController, // Corrected the controller name
                      decoration: const InputDecoration(
                        hintText: 'Phone number',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 11),
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'inter',
                      fontStyle: FontStyle.normal,
                      height: 2.0,
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  buildPasswordTextField(
                      inviteController.obscurePassword,
                      inviteController
                          .passWordController), // Corrected the controller name
                  const SizedBox(height: 40.0),
                  const Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'inter',
                      fontStyle: FontStyle.normal,
                      height: 2.0,
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  buildPasswordTextField(
                      inviteController.obscurePassword,
                      inviteController
                          .confirmPassWordController), // Corrected the controller name
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                          0xFF150D57), // Change to your desired button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Color(0xFFCBFF89),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 55.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
