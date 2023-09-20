import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:giants_free_lunch/screens/homescreen/home_screen.dart';
import 'package:giants_free_lunch/widgets/custom_bottom_bar.dart';

import 'leader_board_screen.dart';

class ProfilePage extends StatelessWidget {
  final Rx<BottomBarItem> selectedItem = BottomBarItem.Profile.obs;
  ProfilePage({super.key}) {
    selectedItem.listen((item) {
      switch (item) {
        case BottomBarItem.Home:
          Get.offAll(() => HomePage()); // Navigate to the Home page
          break;
        case BottomBarItem.Leaderboards:
          Get.offAll(
              () => LeaderBoard()); // Navigate to the Leaderboards screen
          break;
        case BottomBarItem.Profile:
          Get.offAll(() => ProfilePage()); // Navigate to the Profile screen
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: const SafeArea(
        child: Center(
          child: Text("Profile Page"),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedItem: selectedItem,
      ),
    );
  }
}
