import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:giants_free_lunch/screens/login_screen.dart';
import './core/app_export.dart';

AppTheme appTheme = AppTheme();

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
  // Create an instance of Connectivity
  final connectivity = Connectivity();

  // Register NetworkInfo with the Connectivity instance
  final networkInfo = NetworkInfo(connectivity);
  Get.put(networkInfo);
}

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
