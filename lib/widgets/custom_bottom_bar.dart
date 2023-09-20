// ignore_for_file: constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarItem { Home, Leaderboards, Profile }

class CustomBottomNavigationBar extends StatelessWidget {
  final Rx<BottomBarItem> selectedItem;

  CustomBottomNavigationBar({required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.0,
      width: 285.0,
      decoration: BoxDecoration(
        color: const Color(0xFFEFECFF), // Background color
      ),
      child: Obx(
        () => BottomNavigationBar(
          currentIndex: BottomBarItem.values.indexOf(selectedItem.value),
          onTap: (index) => selectedItem.value = BottomBarItem.values[index],
          selectedItemColor: const Color(0xFF150D57), // Active item color
          unselectedItemColor: const Color(0xFF8A8A8A), // Default item color
          type: BottomNavigationBarType.fixed,
          items: [
            _buildBottomNavigationBarItem(
              icon: Icons.home,
              title: 'Home',
              item: BottomBarItem.Home,
            ),
            _buildBottomNavigationBarItem(
              icon: Icons.leaderboard,
              title: 'Leaderboards',
              item: BottomBarItem.Leaderboards,
            ),
            _buildBottomNavigationBarItem(
              icon: Icons.person,
              title: 'Profile',
              item: BottomBarItem.Profile,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required IconData icon,
    required String title,
    required BottomBarItem item,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.0),
        child: Icon(icon),
      ),
      label: title,
    );
  }
}
