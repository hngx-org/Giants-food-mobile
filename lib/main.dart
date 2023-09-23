import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:giants_free_lunch/screens/accept_invite.dart';
import 'package:giants_free_lunch/screens/employee_sign_up_one_screen.dart';
import 'package:giants_free_lunch/screens/login_screen.dart';
import 'package:go_router/go_router.dart';
import './core/app_export.dart';

AppTheme appTheme = AppTheme();
final box = GetStorage();
void main() async {
  await GetStorage.init();
  runApp(const MyApp());

  final connectivity = Connectivity();
  // Register NetworkInfo with the Connectivity instance
  final networkInfo = NetworkInfo(connectivity);
  Get.put(networkInfo);
}

GoRouter _appRoute = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: "/",
    builder: (BuildContext context, GoRouterState state) {
      return AcceptInviteScreen();
    },
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 780),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Free Lunch App',
            theme: ThemeData(
              scaffoldBackgroundColor: appTheme.appBackgroundColor,
              fontFamily: 'Inter',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const SignIn(),
          );
        });
  }
}
