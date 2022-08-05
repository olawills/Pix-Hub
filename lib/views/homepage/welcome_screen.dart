import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallpaper_hub/constants/constant.dart';
import 'package:wallpaper_hub/views/auth/login.dart';
import 'package:wallpaper_hub/views/auth/signUp.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Pix Hall',
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 48.0,
          ),
          // ButtonWidget(
          //   onPressed: () {
          //     Navigator.pushReplacement(
          //       context,
          //       PageTransition(
          //         child: const SignUpWidget(),
          //         type: PageTransitionType.bottomToTop,
          //       ),
          //     );
          //   },
          //   text: 'Register',
          // ),
          // ButtonWidget(
          //   onPressed: () {
          //     Navigator.pushReplacement(
          //       context,
          //       PageTransition(
          //         child: const LoginScreen(),
          //         type: PageTransitionType.bottomToTop,
          //       ),
          //     );
          //   },
          //   text: 'Login',
          // ),
        ],
      ),
    );
  }
}


// animated_text_kit: ^1.3.0