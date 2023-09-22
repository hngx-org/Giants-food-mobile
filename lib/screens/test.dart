import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giants_free_lunch/core/app_export.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, required String title});

  @override
  State<SignUp> createState() => _SignUpState();
}

final appTheme = AppTheme();

class _SignUpState extends State<SignUp> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController lunchPriceController = TextEditingController();

  @override
  void dispose() {
    companyNameController.dispose();
    lunchPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: appTheme.appBackgroundColor,
        centerTitle: true,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: appTheme.primaryColor,
          ),
          width: 157,
          height: 5,
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 58.0), // Add some spacing below the line
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              "Your personal account is ready. Let's \n finish setting up your company's profile.",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 52.0),
            const Text(
              'Company Name',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: TextField(
                controller: companyNameController,
                decoration: const InputDecoration(
                  hintText: 'Your company name',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 11),
                ),
              ),
            ),
            const SizedBox(height: 11.0),
            const Text(
              'Lunch Price',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: TextField(
                controller: lunchPriceController,
                decoration: const InputDecoration(
                  hintText: '#1000',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 11),
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            const SizedBox(height: 11.0),
            const Text(
              'One free lunch worth #1000.00',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(height: 36.0),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: appTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Finish Sign Up',
                  style: TextStyle(
                    color: Color(0xFFCBFF89),
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