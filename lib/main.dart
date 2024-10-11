import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_app/bindings/app_bindings.dart';
import 'package:news_app/module/home/homepage.dart';
import 'package:news_app/routes/pages.dart';
import 'package:news_app/routes/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white, // navigation bar color
        statusBarColor: Colors.white, //
        statusBarIconBrightness: Brightness.dark // status bar color
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routingCallback: (routing) {
        if (routing?.current == Routes.home) {
          if (kDebugMode) {
            print(".................. home ................");
          }
        }
      },
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'test',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      initialBinding: AppBindings(),
      transitionDuration: const Duration(milliseconds: 300),
      defaultTransition: Transition.cupertino,
      home: Homepage(),
      getPages: Pages.pages,
    );
  }
}

// <key>UISupportsDocumentBrowser</key>
// <true/>
//workmanager 0.5.1
