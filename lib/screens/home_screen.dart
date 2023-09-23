import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
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
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appTheme.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    //final signController = Get.put(SignInController());
    // Retrieve saved data from GetStorage
    final box = GetStorage();
    final firstName = box.read('firstName') ?? '';
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
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
                                  child: SvgPicture.asset(
                                    ImageConstant.imgNavprofile,
                                    color: appTheme.appBackgroundColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Ally",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    // SvgPicture.asset(
                                    //   ImageConstant.imgUnsplash9kqbqqyxrk,
                                    //   color: appTheme.appBackgroundColor,
                                    // ),
                                  ],
                                ),
                                SvgPicture.asset(
                                  ImageConstant.imgNotification,
                                  color: appTheme.appBackgroundColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Hi, $firstName",
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  text: 'Give Lunch',
                                  onTap: () => Get.to(() => GiveLunch()),
                                  image: SvgPicture.asset(
                                      height: 20,
                                      width: 20,
                                      ImageConstant.imgTrashAmberA200),
                                ),
                                DisplayContainer(
                                  height: 45,
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 3),
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
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
                ),

                //_topBuild(context),
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
        title: Row(
          children: [
            const CustomText(
              text: "You got 2 free lunches",
              isBold: true,
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              'assets/images/img_group16.png',
              fit: BoxFit.cover,
              height: 20,
              width: 20,
            ),
          ],
        ),
        subtitle: const Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 40, 8),
          child: Text(
            'You received a free lunch for your outstanding contribution. Thank you for your hard work',
            style:
                TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 2),
          ),
        ),
        trailing: const Column(
          children: [
            Text(
              "From: Lucy",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Today: 3:30pm",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      ListTile(
        title: Row(
          children: [
            const CustomText(
              text: "You got 2 free lunches",
              isBold: true,
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              'assets/images/img_group16.png',
              fit: BoxFit.cover,
              height: 20,
              width: 20,
            ),
          ],
        ),
        subtitle: const Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 40, 8),
          child: Text(
            'You received a free lunch for your outstanding contribution. Thank you for your hard work',
            style:
                TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 2),
          ),
        ),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "From: Lucy",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Today: 3:30pm",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      ListTile(
        title: Row(
          children: [
            const CustomText(
              text: "You got 3 free lunches",
              isBold: true,
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              'assets/images/img_group16.png',
              fit: BoxFit.cover,
              height: 20,
              width: 20,
            ),
          ],
        ),
        subtitle: const Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 40, 8),
          child: Text(
            'You received a free lunch for your outstanding contribution. Thank you for your hard work',
            style:
                TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 2),
          ),
        ),
        trailing: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "From: Lucy",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Today: 3:30pm",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
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
        const Text(
          "Recent Activities",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "See all",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: appTheme.primaryColor,
          ),
        ),
      ],
    ),
  );
}

_topBuild(BuildContext context, controller) {
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
                    child: SvgPicture.asset(
                      ImageConstant.imgNavprofile,
                      color: appTheme.appBackgroundColor,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Ally",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      // SvgPicture.asset(
                      //   ImageConstant.imgUnsplash9kqbqqyxrk,
                      //   color: appTheme.appBackgroundColor,
                      // ),
                    ],
                  ),
                  SvgPicture.asset(
                    ImageConstant.imgNotification,
                    color: appTheme.appBackgroundColor,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Obx(
                () => Text(
                  "Hi, $controller.firstName.value",
                  style: TextStyle(
                    color: appTheme.navBackgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DisplayContainer(
                isImageOrIcon: true,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width / 2.2,
                    text: 'Give Lunch',
                    onTap: () => Get.to(() => GiveLunch()),
                    image: SvgPicture.asset(
                        height: 20, width: 20, ImageConstant.imgTrashAmberA200),
                  ),
                  DisplayContainer(
                    height: 45,
                    padding: const EdgeInsets.only(left: 10, right: 3),
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
