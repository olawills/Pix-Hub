import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:wallpaper_hub/views/homepage/welcome_screen.dart';
import 'package:wallpaper_hub/constants/constant.dart';
import 'package:wallpaper_hub/views/auth/login.dart';
import 'package:wallpaper_hub/views/wrapper/wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ConstantColors constantColors = ConstantColors();

  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          PageTransition(
              child: const Wrapper(), type: PageTransitionType.leftToRight)),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            children: <TextSpan>[
              TextSpan(
                text: 'Pics',
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Pacifico',
                ),
              ),
              TextSpan(
                text: ' Hub',
                style: TextStyle(
                  color: Colors.blue,
                  //fontFamily: 'CandydayBwPersonalUseBold-axopE',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//page_transition: ^2.0.9