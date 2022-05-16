import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/screens/login.dart';
import 'package:nekoya_flutter/screens/register.dart';
import 'package:nekoya_flutter/screens/payment.dart';
import 'package:nekoya_flutter/components/menu.dart';
import 'package:nekoya_flutter/utils/url_strategy.dart';
import 'package:nekoya_flutter/utils/navigation_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    usePathUrlStrategy();
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
        splash: 'assets/images/logo_transparent.webp',
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: const Color(0xff1b1c1e),
        splashIconSize: 150,
        nextScreen: const Menu(initialScreen: 2,),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '' : (context) => const Menu(initialScreen: 2,),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/products' : (context) => const Menu(initialScreen: 1,),
        '/cart' : (context) => const Menu(initialScreen: 3,),
        '/sessions': (context) => const NavigationAuth(route: Menu(initialScreen: 0,)),
        '/transactions': (context) => const NavigationAuth(route: Menu(initialScreen: 4,)),
        '/payment': (context) => const NavigationAuth(route: Payment()),
      },
    );
  }
}