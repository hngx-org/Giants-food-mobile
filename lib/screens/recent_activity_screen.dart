import 'package:flutter/material.dart';
import '../controllers/recent_activity_controller.dart';
import '../core/app_export.dart';

class RecentActivityPage extends StatelessWidget {
  final RecentActivityController _controller =
      Get.put(RecentActivityController());

  final Rx<BottomBarItem> selectedItem = BottomBarItem.Home.obs;

  RecentActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.appBackgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
        title: Text(
          'Recent Activity',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: appTheme.primaryColor,
            height: 2,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTab('Lunch received', TopBarItem.Received),
              _buildTab('Lunch given', TopBarItem.Given),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _controller.notifications.length,
                itemBuilder: (context, index) {
                  final notification = _controller.notifications[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: AppTheme.btnTextColor,
                          ),
                          child: Center(
                            child: Text(
                              notification.title,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: appTheme.white,
                                height: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification.description,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: appTheme.primaryColor,
                                  height: 2,
                                ),
                              ),
                              Text(
                                'Given by: ${notification.givenBy}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: appTheme.primaryColor,
                                  height: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          notification.time.toString(), // Format this as needed
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: appTheme.primaryColor,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedItem: selectedItem,
      ),
    );
  }

  Widget _buildTab(String title, TopBarItem item) {
    return GestureDetector(
      onTap: () {
        _controller.clearNotifications(item);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Container(
              width: 120,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: AppTheme.btnBgColor,
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: appTheme.white,
                    height: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
