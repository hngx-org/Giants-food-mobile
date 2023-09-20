import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giants_free_lunch/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:giants_free_lunch/themes/app_theme.dart';
import './core/app_export.dart';
import 'screens/success_screen.dart';

AppTheme appTheme = AppTheme();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Free Lunch App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SuccessScreen(),
    );
  }
}
