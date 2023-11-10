import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_app/screens/login.dart';
import 'package:nekoya_app/screens/register.dart';
import 'package:nekoya_app/screens/payment.dart';
import 'package:nekoya_app/screens/forgotpassword.dart';
import 'package:nekoya_app/screens/onboarding.dart';
import 'package:nekoya_app/components/menu.dart';
import 'package:nekoya_app/utils/navigation_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Storage
  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;

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
    final box = Hive.box();
    final onBoardingStatus = box.get('onboarding', defaultValue: 'true');

    return MaterialApp(
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(accentColor: const Color(0xff8B0000))),
      debugShowCheckedModeBanner: false,
      initialRoute: '',
      routes: {
        '': (context) => AnimatedSplashScreen(
              splash: 'assets/images/logo_transparent.webp',
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: const Color(0xff1b1c1e),
              splashIconSize: 150,
              nextScreen: onBoardingStatus == 'true'
                  ? const Onboarding()
                  : const Menu(
                      initialScreen: 2,
                    ),
            ),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/products': (context) => const Menu(
              initialScreen: 1,
            ),
        '/discounts': (context) => const Menu(
              initialScreen: 0,
            ),
        '/cart': (context) => const Menu(
              initialScreen: 3,
            ),
        '/transactions': (context) => const NavigationAuth(
                route: Menu(
              initialScreen: 4,
            )),
        '/payment': (context) => const NavigationAuth(route: Payment()),
        '/forgotpassword': (context) => const ForgotPassword(),
      },
    );
  }
}
