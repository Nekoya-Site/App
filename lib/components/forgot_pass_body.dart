import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/screens/otp.dart';

class ForgotPassBody extends StatefulWidget {
  const ForgotPassBody({Key? key}) : super(key: key);

  @override
  State<ForgotPassBody> createState() => _ForgotPassBodyState();
}

class _ForgotPassBodyState extends State<ForgotPassBody> {
  TextEditingController emailController = TextEditingController();

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
                Text('  Email', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white60,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
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
                        side: const BorderSide(color: Colors.black)))),
            onPressed: () {
              Map<String, dynamic> data = {
                "email": emailController.text,
              };
              resetPost(data);
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
                        side: const BorderSide(color: Colors.black)))),
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
