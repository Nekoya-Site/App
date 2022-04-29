import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/widgets.dart';
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
      padding: EdgeInsets.all(25),
      child: ListView(
        children: [
          Container(
            child: Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_xvrofzfk.json'),
          ),
          Container(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              'Enter your email to receive instructions on how to reset your password.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 25, bottom: 20),
            child: Row(
              children: [
                Icon(
                  Icons.mail_sharp,
                  color: Colors.white,
                ),
                Text('  EMAIL', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'EMAIL',
                  fillColor: Colors.white),
            ),
          ),
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(Colors.blue.shade800),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade800),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)))),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Otp()));
              },
              child: Text(
                'Reset Password',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(Colors.blue.shade800),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade800),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)))),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                'Back to Login',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
