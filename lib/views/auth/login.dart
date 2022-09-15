import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/constants/constant.dart';
import 'package:wallpaper_hub/views/auth/signUp.dart';
import 'package:wallpaper_hub/views/wrapper/auth_page.dart';
import 'package:wallpaper_hub/widgets/widget.dart';
import 'package:get/get.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
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
                      text: '  Welcome to Pic',
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
                autofillHints: [AutofillHints.email],
                decoration: InputDecoration(
                  labelText: 'Enter a valid Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: passwordController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Enter your password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                onTap: () => AuthController.instance.login(
                    emailController.text.trim(),
                    passwordController.text.trim()),
                text: 'Login',
                icon: Icon(Icons.arrow_forward, size: 32),
              ),
              const SizedBox(height: 24),
              // GestureDetector(
              //   onTap: () => ForgotPasswordPage(),
              //   child: Text(
              //     'Forgot Password? ',
              //     style: TextStyle(
              //       decoration: TextDecoration.underline,
              //       color: Colors.blue,
              //       //Theme.of(context).colorScheme.secondary,
              //       fontSize: 20,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18,
                    color: constantColors.lightBlueColor,
                  ),
                  text: 'No account? ',
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(
                              () => SignUpWidget(),
                            ),
                      text: 'Sign Up',
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
