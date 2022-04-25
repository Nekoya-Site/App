import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Register_Form extends StatefulWidget {
  Register_Form({Key? key}) : super(key: key);

  @override
  State<Register_Form> createState() => _Register_FormState();
}

class _Register_FormState extends State<Register_Form> {
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
              transform: Matrix4.translationValues(0, -35, 0),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Lottie.network(
                            "https://assets10.lottiefiles.com/datafiles/JAmX1SNojoncImC/data.json",
                            frameRate: FrameRate.max,
                            alignment: Alignment.center,
                            fit: BoxFit.fitHeight,
                            height: 250,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Container(
                          padding: const EdgeInsets.only(top: 3, left: 3),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 35,
                            onPressed: () {},
                            color: const Color(0xff8B0000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Already have an account?? \nClick here to Sign In !!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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
