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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appTheme.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _topBuild(context),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _recentBuild(),
                    const SizedBox(
                      height: 30,
                    ),
                    // TextButton(
                    //     onPressed: () => homeController.getLunchesByUserId(),
                    //     child: Text("Clicked")),
                    Obx(
                      () => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homeController.dataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = homeController.dataList[index];
                          return ListTile(
                            title: Row(
                              children: [
                                CustomText(
                                  text: 'you got ${item.quantity} free lunches',
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
                            subtitle: Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 40, 8),
                              child: Text(
                                item.note ?? "",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 2),
                              ),
                            ),
                            trailing: Column(
                              children: [
                                Text(
                                  'From: ${item.senderId}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  item.createdAt.toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                    // //  _activitiesBuild(context, homeController),
                  ],
                ),
              ),
            )
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
          Get.offAll(() => ProfileScreen()); // Navigate to the Profile screen
          break;
      }
    });
  }
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

_topBuild(BuildContext context) {
  final firstName = box.read('firstName');
  final companyName = box.read('companyName') ?? '';
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
                        companyName,
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                text: "Lunch Balance",
                count: box.read('lunchBal') == null? "0": box.read('lunchBal').toString(),
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
