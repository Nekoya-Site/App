import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

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
          child: Lottie.asset('assets/lottieanims/otp.json'),
        ),
        Container(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            'A String of OTP Code Has Been Sent to 08080808080808',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        Form(
            child: Container(
          padding: EdgeInsets.only(top: 15),
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
                      } else if (value.length == 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: InputDecoration(
                      hintText: "0",
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
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
                      } else if (value.length == 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: InputDecoration(
                      hintText: "0",
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
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
                      } else if (value.length == 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: InputDecoration(
                      hintText: "0",
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
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
                      } else if (value.length == 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: InputDecoration(
                      hintText: "0",
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
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
                      } else if (value.length == 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: InputDecoration(
                      hintText: "0",
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
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
                      } else if (value.length == 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: InputDecoration(
                      hintText: "0",
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
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
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "didn't get the code? \t",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Resend code',
                style: TextStyle(color: Colors.blue.shade800),
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
                      side: const BorderSide(color: Colors.red)))),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text(
            'Verify',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]),
    );
  }
}
