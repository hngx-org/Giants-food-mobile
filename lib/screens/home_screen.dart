import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:giants_free_lunch/widgets/container.dart';
import 'package:giants_free_lunch/widgets/custom_bottom_bar.dart';
import 'package:giants_free_lunch/widgets/custom_text.dart';

import '../core/app_export.dart';
import 'leader_board_screen.dart';
import 'profile_page_screen.dart';

final appTheme = AppTheme();

class HomePage extends StatelessWidget {
  final Rx<BottomBarItem> selectedItem = BottomBarItem.Home.obs;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appTheme.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _topBuild(),
            _recentBuild(),
            _activitiesBuild(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedItem: selectedItem,
      ),
    );
  }

  // Listen to changes in selected item and navigate accordingly
  HomePage({super.key}) {
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
}

_activitiesBuild() {
  return ListView(
    shrinkWrap: true,
    children: [
      ListTile(
        title: const CustomText(
          text: "You got 2 free lunches",
          isBold: true,
        ),
        subtitle: const CustomText(
            text:
                'You received a free lunch for your outstanding contribution. Thank you for your hard work'),
        trailing: Column(
          children: [
            CustomText(
              text: "From: Lucy",
              color: appTheme.primaryColor,
              isBold: true,
            ),
            const CustomText(
              text: "Today: 3:30pm",
              fontsize: 12,
            )
          ],
        ),
      ),
      ListTile(
        title: const CustomText(
          text: "You got 3 free lunches",
          isBold: true,
        ),
        subtitle: const CustomText(
            text:
                'You received a free lunch for your outstanding contribution. Thank you for your hard work'),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "From: Lucy",
              color: appTheme.primaryColor,
              isBold: true,
            ),
            const CustomText(
              text: "Today: 3:30pm",
              fontsize: 12,
            )
          ],
        ),
      ),
    ],
  );
}

_recentBuild() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(
      top: 10.sp,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "Recent Activities",
          fontsize: 20.spMin,
          isBold: true,
        ),
        CustomText(
          text: "See all",
          fontsize: 20.spMin,
          isBold: true,
        ),
      ],
    ),
  );
}

_topBuild() {
  return Container(
    width: double.infinity,
    height: 270,
    color: appTheme.primaryColor,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 44,
                    width: 44,
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/account_header.png',
                      fit: BoxFit.cover,
                      height: 44,
                      width: 44,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Ally",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        width: 40,
                        height: 40,
                      )
                    ],
                  ),
                  const Icon(
                    CupertinoIcons.bell,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Hi, John",
                style: TextStyle(
                  color: appTheme.navBackgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              DisplayContainer(
                isImageOrIcon: true,
                height: 50,
                width: double.infinity,
                text: "Lunch Balance",
                count: '3',
                image: Image.asset(
                  'assets/images/snacks.jpeg',
                  fit: BoxFit.cover,
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DisplayContainer(
                      isImageOrIcon: true,
                      height: 50,
                      width: 190.spMin,
                      text: 'Give Lunch',
                      image: Image.asset(
                        'assets/images/snacks.jpeg',
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    DisplayContainer(
                      height: 50,
                      width: 190.spMin,
                      text: 'Withdraw Lunch',
                      sideIcon: Icon(Icons.arrow_upward),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
