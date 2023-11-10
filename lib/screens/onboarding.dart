import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'package:nekoya_app/components/menu.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box();

    return OnBoardingSlider(
        headerBackgroundColor: const Color(0xff1b1c1e),
        pageBackgroundColor: const Color(0xff1b1c1e),
        finishButtonText: 'Shop Now',
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: Color(0xff8B0000),
        ),
        onFinish: () {
          final onBoardingStatus = box.get('onboarding', defaultValue: 'true');
          if (onBoardingStatus == 'true') {
            box.put('onboarding', 'false');
          }

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const Menu(initialScreen: 2)));
        },
        skipTextButton:
            const Text('Skip', style: TextStyle(color: Color(0xff8B0000))),
        trailing:
            const Text('Login', style: TextStyle(color: Color(0xff8B0000))),
        trailingFunction: () {
          Navigator.pushNamed(context, '/login');
        },
        background: [
          Image.asset(
            'assets/images/onboarding.webp',
            height: 350,
          ),
          Image.asset(
            'assets/images/onboarding_2.webp',
            height: 350,
          ),
          Image.asset(
            'assets/images/onboarding_3.webp',
            height: 350,
          ),
        ],
        centerBackground: true,
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                    'Discover an extensive collection of sneakers from all the top brands, conveniently gathered in one place',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Choose sizes based on your preferences',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                    'Experience seamless and hassle-free purchasing with our one-click checkout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
        ]);
  }
}
