import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:nekoya_flutter/components/menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(accentColor: const Color(0xff8B0000))),
      home: AnimatedSplashScreen(
        splash: 'assets/logo_transparent.webp',
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: const Color(0xff1b1c1e),
        splashIconSize: 150,
        nextScreen: const Menu(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}