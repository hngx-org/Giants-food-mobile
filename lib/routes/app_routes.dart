import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:giants_free_lunch/screens/invite_employee.dart';

class Routes {
  static String screen1 = '/screen1';
}

final getPages = [
  GetPage(
    name: Routes.screen1,
    page: () => InviteEmployee(),
  ),
];
