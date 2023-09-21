import 'package:flutter/material.dart';
import 'package:giants_free_lunch/controllers/invite_employee_controller.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/widgets/app_textField.dart';
import 'package:giants_free_lunch/widgets/header_widget.dart';

class InviteEmployee extends StatelessWidget {
  const InviteEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.appBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HeaderWidget(headerText: "Invite Employee"),
                const SizedBox(
                  height: 86,
                ),
                const Text(
                  "Send an Invitation to an employee, they\nwill receive it in their email.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 2,
                  ),
                ),
                const SizedBox(
                  height: 69,
                ),
                AppTextField(
                  textTitle: "Email",
                  textController: textController,
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 36,
                ),
                AppButton(
                  buttonText: "Send Invitation",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
