import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giants_free_lunch/themes/app_theme.dart';

class WithdrawLunchScreen extends StatefulWidget {
  const WithdrawLunchScreen({super.key});

  @override
  State<WithdrawLunchScreen> createState() => _WithdrawLunchScreenState();
}

class _WithdrawLunchScreenState extends State<WithdrawLunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw your lunch'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.r, 40.r, 20.r, 0.r),
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
            SizedBox(height: 32.h),
            ListTile(
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
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 25.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.btnBgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'WIthdraw',
                  style: TextStyle(
                    color: AppTheme.btnTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}