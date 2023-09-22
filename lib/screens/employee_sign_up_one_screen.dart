import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giants_free_lunch/controllers/employee_sign_up_one_controller.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/screens/employee_sign_up_two_screen.dart';
import 'package:giants_free_lunch/widgets/app_text_fields.dart';
import 'package:giants_free_lunch/widgets/custom_text.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignUpController signUpController = SignUpController();

  @override
  void dispose() {
    signUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
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
            const SizedBox(
              height: 58.0,
            ),
            CustomText(
              text: "Sign In",
              isBold: true,
              fontsize: 20.sp,
            ),
            const CustomText(
              isAligned: true,
              text: 'Let\'s get started! Sign up with \n your email below.',
              fontsize: 16,
            ),
            const SizedBox(height: 20.0),
            AppTextField(
              textTitle: 'First Name',
              textController: signUpController.firstNameController,
              hintText: 'First name',
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            const SizedBox(height: 10.0),
            AppTextField(
              textTitle: 'Last Name',
              textController: signUpController.lastNameController,
              hintText: 'Last name',
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            const SizedBox(height: 10.0),
            AppTextField(
              textTitle: 'Email',
              textController: signUpController.emailController,
              hintText: 'Email',
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10.0),
            AppTextField(
              textTitle: 'Phone',
              textController: signUpController.phoneNumberController,
              hintText: 'Phone',
              inputFormatter: [FilteringTextInputFormatter.digitsOnly],
              keyBoardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 10.0),
            AppTextField(
              textTitle: 'Password',
              textController: signUpController.passWordController,
              hintText: 'Password',
              obscureText: signUpController.obscurePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    signUpController.obscurePassword =
                        !signUpController.obscurePassword;
                  });
                },
                icon: Icon(
                  signUpController.obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: 18,
                ),
              ),
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 10.0),
            AppTextField(
              textTitle: 'Confirm Password',
              textController: signUpController.confirmPassWordController,
              hintText: 'Confirm Password',
              obscureText: signUpController.obscurePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    signUpController.obscurePassword =
                        !signUpController.obscurePassword;
                  });
                },
                icon: Icon(
                  signUpController.obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: 18,
                ),
              ),
              decoration: const InputDecoration(labelText: 'Confirm Password'),
            ),
            const SizedBox(height: 20.0),
            AppButton(
              buttonText: 'Continue',
              onPressed: () {
                signUpController.validation();
                Get.to(() => SecondSignUp());
              },
            ),
          ],
        ),
      ),
    );
  }
}
