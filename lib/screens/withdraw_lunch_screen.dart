import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/screens/add_bank_account_screen.dart';
import 'package:giants_free_lunch/themes/app_theme.dart';

import '../main.dart';

class WithdrawLunchScreen extends StatefulWidget {
  const WithdrawLunchScreen({super.key});

  @override
  State<WithdrawLunchScreen> createState() => _WithdrawLunchScreenState();
}

class _WithdrawLunchScreenState extends State<WithdrawLunchScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.appBackgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
        title: Text(
          "Withdraw Your Lunch",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: appTheme.primaryColor,
            height: 2,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.r, 40.r, 20.r, 24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'With draw lunch to your\nbank account',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 48.h),
            // space for account details
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: const Icon(
                Icons.curtains_closed_outlined,
              ),
              title: Text(
                'Bank account',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              subtitle: const Text(
                'Firstbank ****5949',
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
              trailing: const Icon(
                Icons.check_circle_outline,
              ),
            ),
            SizedBox(height: 12.h),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: const Icon(
                Icons.credit_card_outlined,
              ),
              title: Text(
                'Add bank account',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              trailing: const Icon(Icons.add_circle_outline_outlined),
            ),
            SizedBox(height: 77.h),
            Text(
              'Free lunch worth of #2,500.00 will be credited\n'
              'to your bank account',
              style: TextStyle(fontSize: 14.sp, height: 2),
            ),
            SizedBox(height: 25.h),
            AppButton(
              buttonText: "Withdraw",
              onPressed: () {
                Get.to(AddBankAccountScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
