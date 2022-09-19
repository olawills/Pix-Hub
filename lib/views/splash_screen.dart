import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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