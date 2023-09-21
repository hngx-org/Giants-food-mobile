import 'package:flutter/material.dart';
import 'package:giants_free_lunch/controllers/invite_employee_controller.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/widgets/app_textField.dart';

class InviteEmployee extends StatefulWidget {
  const InviteEmployee({super.key});

  @override
  State<InviteEmployee> createState() => _InviteEmployeeState();
}

class _InviteEmployeeState extends State<InviteEmployee> {
  final _inviteController = Get.put(InviteController());
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.appBackgroundColor,
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
          "Invite Employee",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: appTheme.primaryColor,
            height: 2,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 56,
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
                  textController: _inviteController.textController,
                  hintText: "Email",
                  // suffixIcon: IconButton(
                  //   splashColor: Colors.transparent,
                  //   icon: obscureText
                  //       ? Icon(
                  //           Icons.visibility_off,
                  //           color: appTheme.black200,
                  //         )
                  //       : const Icon(
                  //           Icons.visibility,
                  //           color: Colors.deepPurple,
                  //         ), //change icon based on boolean value
                  //   onPressed: () {
                  //     setState(() {
                  //       obscureText = !obscureText;
                  //     });
                  //   },
                  // ),
                  // obscureText: obscureText,
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
