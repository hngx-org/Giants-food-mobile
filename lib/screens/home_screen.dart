import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giants_free_lunch/controllers/home_controller.dart';
import 'package:giants_free_lunch/controllers/login_controller.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/screens/give_lunch_screen.dart';
import 'package:giants_free_lunch/screens/leader_board_screen.dart';
import 'package:giants_free_lunch/screens/profile_page_screen.dart';
import 'package:giants_free_lunch/screens/withdraw_lunch_screen.dart';
import 'package:giants_free_lunch/widgets/container.dart';
import 'package:giants_free_lunch/widgets/custom_text.dart';

//final appTheme = AppTheme();

class HomePage extends StatelessWidget {
  final Rx<BottomBarItem> selectedItem = BottomBarItem.Home.obs;
  final signController = Get.put(SignInController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
