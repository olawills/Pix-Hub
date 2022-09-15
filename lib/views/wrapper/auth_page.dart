import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_hub/views/auth/login.dart';
import 'package:wallpaper_hub/views/auth/signUp.dart';
import 'package:wallpaper_hub/views/homepage/homepage.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);

    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("Login page");
      Get.off(() => const LoginScreen());
    } else {
      Get.offAll(() => HomePage(email: user.email!));
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("User Registration", "User message",
          backgroundColor: Colors.blueAccent,
          snackPosition: SnackPosition.TOP,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ));
    }
  }

  void login(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("User Login", "Login message",
          backgroundColor: Colors.blueAccent,
          snackPosition: SnackPosition.TOP,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ));
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
