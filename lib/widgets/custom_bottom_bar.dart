// ignore_for_file: constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/app_export.dart';

ImageConstant imageConstant = ImageConstant();

enum BottomBarItem { Home, Leaderboards, Profile }

class CustomBottomNavigationBar extends StatelessWidget {
  final Rx<BottomBarItem> selectedItem;

  const CustomBottomNavigationBar({required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        // selectedIconTheme: IconThemeData(color:const Color(0xFF150D57) ),
        backgroundColor: appTheme.bottomNavBarBG,
        currentIndex: BottomBarItem.values.indexOf(selectedItem.value),
        onTap: (index) => selectedItem.value = BottomBarItem.values[index],
        selectedItemColor: const Color(0xFF150D57), // Active item color
        unselectedItemColor: const Color(0xFF8A8A8A), // Default item color
        type: BottomNavigationBarType.fixed,
        items: [
          _buildBottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageConstant.imgNavhome,
              color: const Color(0xFF8A8A8A),
            ),
            title: 'Home',
            item: BottomBarItem.Home,
            activeIcon: SvgPicture.asset(
              ImageConstant.imgNavhome,
              color: const Color(0xFF150D57),
            ),
          ),
          _buildBottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageConstant.imgNavleaderboards,
              color: const Color(0xFF8A8A8A),
            ),
            title: 'Leaderboards',
            item: BottomBarItem.Leaderboards,
            activeIcon: SvgPicture.asset(
              ImageConstant.imgNavleaderboards,
              color: const Color(0xFF150D57),
            ),
          ),
          _buildBottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageConstant.imgNavprofile,
              color: const Color(0xFF8A8A8A),
            ),
            title: 'Profile',
            item: BottomBarItem.Profile,
            activeIcon: SvgPicture.asset(
              ImageConstant.imgNavprofile,
              color: const Color(0xFF150D57),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required Widget icon,
    required String title,
    required BottomBarItem item,
    required Widget activeIcon,
  }) {
    return BottomNavigationBarItem(
      activeIcon: activeIcon,
      icon: icon,
      label: title,
    );
  }
}
