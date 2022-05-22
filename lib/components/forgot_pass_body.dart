import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/screens/otp.dart';

class ForgotPassBody extends StatefulWidget {
  const ForgotPassBody({Key? key}) : super(key: key);

  @override
  State<ForgotPassBody> createState() => _ForgotPassBodyState();
}

class _ForgotPassBodyState extends State<ForgotPassBody> {
  TextEditingController emailController = TextEditingController();

  Future forgotForm(BuildContext context) async {
    if (emailController.text.isEmpty) {
      return 999;
    } else {
      Map<String, dynamic> data = {
        "email": emailController.text,
      };

      var response = await resetPost(data);
      return {'statusCode': response['statusCode'], 'data': response['data']};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: ListView(
        children: [
          Container(
            child: Lottie.asset('assets/lottie/forgot_pass_body.json'),
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
              if (emailController.text.isEmpty) {
                showAlertDialog(context);
              } else {
                forgotForm(context).then((res) {
                  if (res['statusCode'] == 200) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Otp()));
                  } else if (res['statusCode'] == 205) {
                    showEmailWarn(context);
                  } else {
                    showBad(context);
                  }
                });
              }
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

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK", style: TextStyle(color: Colors.red)),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    backgroundColor: const Color(0xff1b1c1e),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    title: const Text(
      "Error",
      style: TextStyle(color: Colors.white),
    ),
    content: const Text(
      "Please fill in your Email Address!!",
      style: TextStyle(color: Colors.white70),
    ),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showEmailWarn(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK", style: TextStyle(color: Colors.red)),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    backgroundColor: const Color(0xff1b1c1e),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    title: const Text(
      "Error",
      style: TextStyle(color: Colors.white),
    ),
    content: const Text(
      "Sorry, But your email is not registered in our system !!",
      style: TextStyle(color: Colors.white70),
    ),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showBad(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK", style: TextStyle(color: Colors.red)),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    backgroundColor: const Color(0xff1b1c1e),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    title: const Text(
      "Error",
      style: TextStyle(color: Colors.white),
    ),
    content: const Text(
      "Bad Request!!",
      style: TextStyle(color: Colors.white70),
    ),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
