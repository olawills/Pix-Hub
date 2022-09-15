import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/constants/constant.dart';
import 'package:get/get.dart';
import 'package:wallpaper_hub/views/auth/login.dart';
import 'package:wallpaper_hub/views/wrapper/auth_page.dart';

import '../../widgets/widget.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              FlutterLogo(size: 120),
              SizedBox(height: 60),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '           Hey there, \n Welcome to Pic',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: ' Hub',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Enter a valid Email',
                ),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: passwordController,
                obscureText: true,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                onTap: () => AuthController.instance.register(
                    emailController.text.trim(),
                    passwordController.text.trim()),
                text: 'Sign Up',
                icon: Icon(Icons.arrow_forward, size: 32),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18,
                    color: constantColors.lightBlueColor,
                  ),
                  text: 'Already have an account? ',
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(
                              () => Get.back(),
                            ),
                      text: 'Login in',
                      style: TextStyle(
                        color: constantColors.redColor,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
