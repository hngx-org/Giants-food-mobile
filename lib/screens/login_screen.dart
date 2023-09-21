import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giants_free_lunch/controllers/login_controller.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/screens/employee_sign_up_two_screen.dart';
import 'package:giants_free_lunch/widgets/app_custom_buttons.dart';
import 'package:giants_free_lunch/widgets/custom_text.dart';
import 'package:giants_free_lunch/widgets/custom_textfieldx.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final signController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    CustomText(
                      text: "Sign In",
                      isBold: true,
                      fontsize: 20.sp,
                    ),
                    const CustomText(
                      isAligned: true,
                      text: "Welcome Back! Please Sign into your account",
                      fontsize: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: signController.formFieldKey,
                child: Column(
                  children: [
                    InputField(
                        hint: "Email",
                        title: "Email",
                        controller: signController.emailController),
                    Obx(() => InputField(
                          hint: "Password",
                          title: "Password",
                          isObsured: signController.isObsecure.value,
                          icon: IconButton(
                            onPressed: () {
                              signController.isObsecure.value =
                                  !signController.isObsecure.value;
                            },
                            icon: Icon(
                              signController.isObsecure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          controller: signController.passwordController,
                        )),
                    const SizedBox(height: 10),
                    SizedBox(height: 40.h),
                    AppButton(
                      buttonText: 'Sign In',
                      onPressed: () {
                        signController.validation();
                        Get.off(HomePage());
                      },
                    )
                  ],
                ),
              ),
              CustomText(
                  text: "Do you want to create an organization?",
                  fontsize: 15.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Get.to(() => SecondSignUp()),
                    child: CustomText(text: 'Create account', fontsize: 15.sp),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
