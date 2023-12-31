import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giants_free_lunch/controllers/login_controller.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/screens/employee_sign_up_one_screen.dart';
import 'package:giants_free_lunch/widgets/custom_text.dart';
import 'package:giants_free_lunch/widgets/custom_textfieldx.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final SignInController signController = Get.find();
  final signController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    // Retrieve saved data from GetStorage
    // final box = GetStorage();
    // final firstName = box.read('firstName') ?? '';
    // final email = box.read('email') ?? '';
    // final accessToken = box.read('accessToken') ?? '';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      CustomText(
                        text: "Sign In",
                        isBold: true,
                        fontsize: 18.sp,
                      ),
                      const CustomText(
                        isAligned: true,
                        text: "Welcome Back! Please Sign into your account",
                        fontsize: 14,
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
                            icon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  signController.isObsecure.value =
                                      !signController.isObsecure.value;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  signController.isObsecure.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                  size: 19,
                                ),
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
                        },
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: CustomText(
                          text: "Do you want to create an organization?",
                          fontsize: 13.sp,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => Get.off(() => const SignUp()),
                            child: CustomText(
                                text: 'Create account', fontsize: 14.sp),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
