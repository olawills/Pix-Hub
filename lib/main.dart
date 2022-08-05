import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_hub/utils/utils.dart';
import 'package:wallpaper_hub/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wallpaper_hub/widgets/notifiers_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => NotifiersWidget(),
          ),
        ],
        child: MaterialApp(
          scaffoldMessengerKey: Utils.messengerKey,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Pix Hub',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            // fontFamily: 'Pacifico',
          ),
          home: const SplashScreen(),
        ));
  }
}
