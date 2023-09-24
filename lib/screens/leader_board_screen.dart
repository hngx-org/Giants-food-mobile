import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giants_free_lunch/screens/profile_page_screen.dart';

import '../core/app_export.dart';

class LeaderBoard extends StatelessWidget {
  final Rx<BottomBarItem> selectedItem = BottomBarItem.Leaderboards.obs;
  LeaderBoard({super.key}) {
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
              backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
        title: Text(
          'Leaderboard',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: appTheme.primaryColor,
            height: 2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Top 3 workers',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _workLeaders(),
            const SizedBox(
              height: 10,
            ),
            _workLeaders(),
            const SizedBox(
              height: 10,
            ),
            _workLeaders(),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'All top workers',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 2,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _workLeaders(),
            const SizedBox(
              height: 10,
            ),
            _workLeaders(),
            const SizedBox(
              height: 10,
            ),
            _workLeaders(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedItem: selectedItem,
      ),
    );
  }

  Container _workLeaders() {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: appTheme.primaryColor,
        ),
        borderRadius: BorderRadius.circular(10),
        color: appTheme.white,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(ImageConstant.imgUnsplashqayxtcv4aq31x31),
        ),
        title: const Text(
          'Kolawole Emmanuel',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            color: Colors.black,
            height: 2,
          ),
        ),
        trailing: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 16, // Adjust the size as needed
            ),
            Text(
              '4.9',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                height: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
