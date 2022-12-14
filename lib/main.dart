import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_hub/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wallpaper_hub/views/wrapper/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pics Hub',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // fontFamily: 'Pacifico',
      ),
      home: const SplashScreen(),
    );
  }
}
