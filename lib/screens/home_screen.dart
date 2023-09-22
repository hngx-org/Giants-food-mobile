import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appTheme.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _topBuild(context),
                const SizedBox(
                  height: 10,
                ),
                _recentBuild(),
                _activitiesBuild(),
              ],
            ),
          ),
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
          Get.offAll(() => ProfileScreen()); // Navigate to the Profile screen
          break;
      }
    });
  }
}

_activitiesBuild() {
  return ListView(
    physics: const NeverScrollableScrollPhysics(),
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
    padding: const EdgeInsets.symmetric(horizontal: 19).copyWith(
      top: 10.sp,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "Recent Activities",
          fontsize: 16.sp,
          isBold: true,
        ),
        CustomText(
          text: "See all",
          fontsize: 14.sp,
          isBold: true,
        ),
      ],
    ),
  );
}

_topBuild(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 250,
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
                    child: Icon(
                      Icons.person,
                      color: appTheme.appBackgroundColor,
                    ),
                  ),
                  const Row(
                    children: [
                      Text(
                        "Ally",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                      // Image.asset(
                      //   'assets/images/logo.png',
                      //   width: 40,
                      //   height: 40,
                      // )
                    ],
                  ),
                  const Icon(
                    CupertinoIcons.bell,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(height: 16),
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
                height: 45,
                width: double.infinity,
                text: "Lunch Balance",
                count: '3',
                image: Image.asset(
                  'assets/images/img_group16.png',
                  fit: BoxFit.cover,
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DisplayContainer(
                    isImageOrIcon: true,
                    height: 45,
                    width: MediaQuery.of(context).size.width / 2.2,
                    text: 'Give Lunch',
                    onTap: () => Get.to(() => GiveLunch()),
                    image: Image.asset(
                      'assets/images/img_group16.png',
                      fit: BoxFit.cover,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  DisplayContainer(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 2.2,
                    text: 'Withdraw Lunch',
                    onTap: () {
                      Get.to(() => const WithdrawLunchScreen());
                    },
                    sideIcon: const Icon(
                      Icons.arrow_upward,
                      size: 18,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}
