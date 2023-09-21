import 'package:flutter/material.dart';
import 'package:giants_free_lunch/screens/employee_sign_up_one_screen.dart';
import './core/app_export.dart';
import 'screens/accept_invite.dart';

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
      home: AcceptInviteScreen(),
    );
  }
}

