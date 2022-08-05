import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/constants/constant.dart';
import 'package:wallpaper_hub/utils/utils.dart';
import 'package:wallpaper_hub/views/forgot_password_page.dart';
import 'package:wallpaper_hub/widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);
  final Function() onClickedSignUp;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //TextEditingController controller = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  final navigatorKey = GlobalKey<NavigatorState>();
  final ConstantColors constantColors = ConstantColors();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    //widget.controller.removeListener(onListen);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //widget.controller.addListener(onListen);
  }

  //void onListen() => setState(() {});

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
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                autofillHints: [AutofillHints.email],
                decoration: InputDecoration(
                  labelText: 'Enter a valid Email',
                  // prefixIcon: Icon(Icons.email),
                  // suffixIcon: widget.controller.text.isEmpty
                  //     ? Container(width: 0)
                  //     : IconButton(
                  //         icon: Icon(Icons.close),
                  //         onPressed: () => widget.controller.clear(),
                  //       ),
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
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
                onPressed: () => logIn(),
                text: 'Login',
                icon: Icon(Icons.arrow_forward, size: 32),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () => ForgotPasswordPage(),
                child: Text(
                  'Forgot Password? ',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                    //Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
              ),
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
                        ..onTap = widget.onClickedSignUp,
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

  Future logIn() async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
