import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_hub/views/homepage/homepage.dart';
import 'package:wallpaper_hub/views/wrapper/auth_page.dart';
import 'package:wallpaper_hub/widgets/notifiers_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Provider.of<NotifiersWidget>(context, listen: false)
                .logOutDialog(context);
          } else if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
