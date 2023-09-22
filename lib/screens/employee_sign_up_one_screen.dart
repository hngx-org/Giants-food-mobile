import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giants_free_lunch/controllers/employee_sign_up_one_controller.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/screens/employee_sign_up_two_screen.dart';
import 'package:giants_free_lunch/screens/login_screen.dart';

import '../widgets/custom_text.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  void dispose() {
    signUpController.dispose();
    super.dispose();
  }

  Container buildPasswordTextField(
      bool obscure, TextEditingController controller, Widget suffixIcon) {
    return Container(
      height: 40,
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
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 11, bottom: 18),
          suffixIcon: suffixIcon,
        ),
        obscureText: obscure,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: appTheme.appBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 109,
                    right: 109,
                    top: 20,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 38.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            // color: Color(0xff000000),
                            // fontFamily: 'Inter',
                            height: 1.56),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Text(
                      'Let\'s get started! Sign up with \n your email below.',
                      style: TextStyle(
                        fontSize: 14.0,
                        // color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        // fontFamily: 'Inter',
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
                        // fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        // color: Color(0xff000000),
                        height: 2.0,
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: const Color(0xFF8A8A8A),
                          width: 1.0,
                        ),
                      ),
                      child: TextField(
                        controller: signUpController.firstNameController,
                        decoration: const InputDecoration(
                          hintText: 'First name',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 11, bottom: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Last name',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        // fontFamily: 'inter',
                        fontStyle: FontStyle.normal,
                        height: 2.0,
                        // color: Color(0xff000000),
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: const Color(0xFF8A8A8A),
                          width: 1.0,
                        ),
                      ),
                      child: TextField(
                        controller: signUpController.lastNameController,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          hintText: 'Last name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 11, bottom: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        // fontFamily: 'inter',
                        fontStyle: FontStyle.normal,
                        height: 2.0,
                        // color: Color(0xff000000),
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: const Color(0xFF8A8A8A),
                          width: 1.0,
                        ),
                      ),
                      child: TextField(
                        controller: signUpController.emailController,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          hintText: 'Email',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 11, bottom: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Phone number',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        // fontFamily: 'inter',
                        fontStyle: FontStyle.normal,
                        height: 2.0,
                        // color: Color(0xff000000),
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: const Color(0xFF8A8A8A),
                          width: 1.0,
                        ),
                      ),
                      child: TextField(
                        controller: signUpController.phoneNumberController,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          hintText: 'Phone number',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 11, bottom: 18),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        // fontFamily: 'inter',
                        fontStyle: FontStyle.normal,
                        height: 2.0,
                        // color: Color(0xff000000),
                      ),
                    ),
                    buildPasswordTextField(
                      signUpController.obscurePassword,
                      signUpController.passWordController,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            signUpController.obscurePassword =
                                !signUpController.obscurePassword;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            signUpController.obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                            size: 19,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        // fontFamily: 'inter',
                        fontStyle: FontStyle.normal,
                        height: 2.0,
                        // color: Color(0xff000000),
                      ),
                    ),
                    buildPasswordTextField(
                      signUpController.obscureConfirmPassword,
                      signUpController.confirmPassWordController,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            signUpController.obscureConfirmPassword =
                                !signUpController.obscureConfirmPassword;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            signUpController.obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                            size: 19,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    AppButton(
                      buttonText: "Continue",
                      onPressed: () {
                        Get.to(const SecondSignUp());
                      },
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: CustomText(
                        text: "Already have an account?",
                        fontsize: 13.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => Get.off(() => const SignIn()),
                          child: CustomText(text: 'Sign In', fontsize: 14.sp),
                        )
                      ],
                    ),
                    const SizedBox(height: 55.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}