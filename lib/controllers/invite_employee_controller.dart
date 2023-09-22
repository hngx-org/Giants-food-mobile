import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:giants_free_lunch/core/extentions/extenstion.dart';

class InviteController extends GetxController {
  final TextEditingController textController = TextEditingController();

  validation() async {
    if (textController.text.trim().isEmpty) {
      errorMethod('Email  can not be empty');
    } else if (!textController.text.emailValidation) {
      errorMethod('Please enter a vaild email');
    }
  }
}
