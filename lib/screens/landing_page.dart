import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giants_free_lunch/controllers/accept_invite_controller.dart';
import 'package:giants_free_lunch/core/app_export.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final controller = Get.put(AcceptInviteController());

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.appBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 14, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 56,
                ),
                SvgPicture.asset(
                  "assets/images/logo.svg",
                  height: 250,
                ),
                const Text(
                  "Welcome to our Free lunch app, \nhighly sponsored by team giants.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 2,
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                AppButton(
                  buttonText: "Get Started",
                  onPressed: () {
                    controller.hasAnAccount();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
