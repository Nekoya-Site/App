import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Register_Verify extends StatefulWidget {
  Register_Verify({Key? key}) : super(key: key);

  @override
  State<Register_Verify> createState() => _Register_VerifyState();
}

class _Register_VerifyState extends State<Register_Verify> {
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
                        height: 20,
                      ),
                      const Text(
                        "Verify Your Email Address",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Lottie.network(
                            "https://assets1.lottiefiles.com/packages/lf20_IUWMcw.json",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Before proceeding, please check your email\n for a verification link to verify \nyour email address.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ],
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
