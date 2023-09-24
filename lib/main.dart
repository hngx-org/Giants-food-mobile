import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:giants_free_lunch/screens/accept_invite.dart';
import 'package:giants_free_lunch/screens/employee_sign_up_one_screen.dart';
import 'package:giants_free_lunch/screens/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_links/uni_links.dart';
import './core/app_export.dart';
import 'screens/leader_board_screen.dart';

AppTheme appTheme = AppTheme();
final box = GetStorage();
void main() async {
  await GetStorage.init();
  runApp(const MyApp());

  final connectivity = Connectivity();
  // Register NetworkInfo with the Connectivity instance
  final networkInfo = NetworkInfo(connectivity);
  Get.put(networkInfo);
  initUniLinks();
}

Future<void> initUniLinks() async {
  try {
    final initialLink = await getInitialUri();
    print("initialLink $initialLink");
    handleLink(initialLink);
  } on PlatformException {
    // Handle exceptions if any
  }

  StreamSubscription _sub = uriLinkStream.listen((Uri? uri) {
    handleLink(uri);
  }, onError: (err) {
    // Handle errors if any
  });
  _sub.cancel();
}

void handleLink(Uri? uri) {
  if (uri != null && uri.queryParameters.isNotEmpty) {
    // String token = jsonEncode(uri.queryParameters);
    box.write("inviteToken", uri.queryParameters["token"]) ;
    String path = uri.pathSegments[0];
    // if (path == "acceptInvite"){
      
    runApp(const MyAppDeepLink());
    // }
  } else {
    // runApp(const MyAppDeepLink());
  }
}

class MyAppDeepLink extends StatelessWidget {
  const MyAppDeepLink({super.key});

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
          home: AcceptInviteScreen(),
        );
      },
    );
  }
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
            home: LeaderBoard(),
          );
        });
  }
}

