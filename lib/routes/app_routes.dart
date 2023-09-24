import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:giants_free_lunch/screens/invite_employee.dart';

class Routes {
  static String invite = '/invite';
}

final getPages = [
  GetPage(
    name: Routes.invite,
    page: () => const InviteEmployee(),
  ),
];
