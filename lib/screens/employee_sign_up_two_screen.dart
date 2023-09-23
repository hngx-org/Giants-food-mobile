import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giants_free_lunch/controllers/employee_sign_up_two_controller.dart';
import 'package:giants_free_lunch/core/app_export.dart';

import 'package:giants_free_lunch/screens/login_screen.dart';
import 'package:giants_free_lunch/widgets/app_custom_buttons.dart';
import 'package:giants_free_lunch/widgets/custom_text.dart';
import 'package:giants_free_lunch/widgets/custom_textfieldx.dart';

final appTheme = AppTheme();

class SecondSignUp extends StatefulWidget {
  const SecondSignUp({super.key});

  @override
  State<SecondSignUp> createState() => _SecondSignUpState();
}

//injecting the controller
final controller = Get.put(SecondSignUpController());

class _SecondSignUpState extends State<SecondSignUp> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 5.h,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appTheme.primaryColor,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(height: 20.h),
              Center(
                child: Column(
                  children: [
                    CustomText(
                      text: "Sign Up",
                      isBold: true,
                      fontsize: 20.sp,
                    ),
                    const CustomText(
                      isAligned: true,
                      text:
                          "Your personal account is ready. Lets finish \n setting up your company's profile",
                      fontsize: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              InputField(
                  hint: "Your company name",
                  title: "Company Name",
                  controller: controller.companyNameController),
              InputField(
                  hint: "₦ 1,000 ",
                  title: "Lunch Price",
                  controller: controller.lunchPriceController),
              const SizedBox(height: 10),
              const CustomText(text: 'One free lunch worth ₦ 1,000.00 '),
              SizedBox(height: 40.h),
              AppButton(
                buttonText: 'Finish Sign Up',
                onPressed: () {
                  //controller.validation();
                  Get.to(() => HomePage());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
