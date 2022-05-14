import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nekoya_flutter/screens/login.dart';
import 'package:nekoya_flutter/screens/otp.dart';

class ForgotPassBody extends StatefulWidget {
  const ForgotPassBody({Key? key}) : super(key: key);

  @override
  State<ForgotPassBody> createState() => _ForgotPassBodyState();
}

class _ForgotPassBodyState extends State<ForgotPassBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: ListView(
        children: [
          Container(
            child: Lottie.asset('assets/lottieanims/forgot_pass_body.json'),
          ),
          Container(
            padding: const EdgeInsets.only(top: 25),
            child: const Text(
              'Enter your email to receive instructions on how to reset your password.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 20),
            child: Row(
              children: const [
                Icon(
                  Icons.mail_sharp,
                  color: Colors.white,
                ),
                Text('  EMAIL', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'EMAIL',
                  fillColor: Colors.white),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(const Color(0xff8B0000)),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xff8B0000)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.red)))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Otp()));
            },
            child: const Text(
              'Reset Password',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(const Color(0xff8B0000)),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xff8B0000)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.red)))),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text(
              'Back to Login',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
