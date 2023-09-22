import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class RegisterVerify extends StatefulWidget {
  const RegisterVerify({Key? key}) : super(key: key);

  @override
  State<RegisterVerify> createState() => RegisterVerifyState();
}

class RegisterVerifyState extends State<RegisterVerify> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Card(
          color: const Color(0xff212226),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "Verify Your Email Address",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Lottie.asset(
                            "assets/lottie/register_verify.json",
                            frameRate: FrameRate.max,
                            alignment: Alignment.center,
                            height: 350,
                            fit: BoxFit.fitHeight,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Before proceeding, please check your email for a verification link to verify your email address.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(15.0)),
                            foregroundColor: MaterialStateProperty.all(
                                const Color(0xff8B0000)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff8B0000)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                        color: Colors.black)))),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
