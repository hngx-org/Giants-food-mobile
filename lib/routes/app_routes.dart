import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:giants_free_lunch/screens/invite_employee.dart';

class Routes {
  static String invite = '/invite';
  static String resetPassword = '/resetPassword';
}

final getPages = [
  GetPage(
    name: Routes.invite,
    page: () => InviteEmployee(),
  ),
  // change here
  GetPage(
    name: Routes.resetPassword,
    page: () => InviteEmployee(),
  ),
];
