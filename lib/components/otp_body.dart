import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class OtpBody extends StatefulWidget {
  const OtpBody({Key? key}) : super(key: key);

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: ListView(children: [
        Container(
          child: Lottie.asset('assets/lottie/otp.json'),
        ),
        Container(
          padding: const EdgeInsets.only(top: 15),
          child: const Text(
            'Check your Telegram app for 2FA code',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        Form(
            child: Container(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: const InputDecoration(
                      hintText: "",
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: const InputDecoration(
                      hintText: "",
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: const InputDecoration(
                      hintText: "",
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: const InputDecoration(
                      hintText: "",
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: const InputDecoration(
                      hintText: "",
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: const InputDecoration(
                      hintText: "",
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
        Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Didn't get it?? \t",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Resend Code',
                style: TextStyle(color: Colors.red),
              ),
            ],
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
            'Submit',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]),
    );
  }
}
