import 'package:get/get.dart';

enum TopBarItem { Received, Given }

class RecentActivityController extends GetxController {
  RxList<NotificationModel> notifications = <NotificationModel>[].obs;

  void addNotification(NotificationModel notification) {
    notifications.add(notification);
  }

  void clearNotifications(TopBarItem item) {
    if (item == TopBarItem.Received) {
      notifications.clear();
    }
  }
}

class NotificationModel {
  final String title;
  final String description;
  final DateTime time;
  final String givenBy;

  NotificationModel({
    required this.title,
    required this.description,
    required this.time,
    required this.givenBy,
  });
}
