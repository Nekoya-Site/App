import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:nekoya_flutter/components/menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const Nekoya());
  });
}

class Nekoya extends StatefulWidget {
  const Nekoya({Key? key}) : super(key: key);

  @override
  State<Nekoya> createState() => _NekoyaState();
}

class _NekoyaState extends State<Nekoya> {
  
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
        nextScreen: const Menu(initialScreen: 2,),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}