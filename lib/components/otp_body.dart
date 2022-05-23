import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/components/menu.dart';
import 'package:nekoya_flutter/data/auth.dart';

class OtpBody extends StatefulWidget {
  const OtpBody({Key? key, required this.otpToken}) : super(key: key);

  final String otpToken;

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  TextEditingController otpCode1 = TextEditingController();
  TextEditingController otpCode2 = TextEditingController();
  TextEditingController otpCode3 = TextEditingController();
  TextEditingController otpCode4 = TextEditingController();
  TextEditingController otpCode5 = TextEditingController();
  TextEditingController otpCode6 = TextEditingController();

  Future submitForm(BuildContext context) async {
    if (otpCode1.text.isEmpty || otpCode2.text.isEmpty || otpCode3.text.isEmpty || otpCode4.text.isEmpty || otpCode5.text.isEmpty || otpCode6.text.isEmpty) {
      return 999;
    } else {
      Map<String, dynamic> data = {
        "token": widget.otpToken,
        "code": "${otpCode1.text}${otpCode2.text}${otpCode3.text}${otpCode4.text}${otpCode5.text}${otpCode6.text}"
      };

      var response = await otpPost(data);
      return {'statusCode': response['statusCode'], 'data': response['data']};
    }
  }

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
                    controller: otpCode1,
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
                    controller: otpCode2,
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
                    controller: otpCode3,
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
                    controller: otpCode4,
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
                    controller: otpCode5,
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
                    controller: otpCode6,
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
        const SizedBox(height: 30,),
        ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
              foregroundColor:
                  MaterialStateProperty.all(const Color(0xff8B0000)),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff8B0000)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.black)))),
          onPressed: () {
            submitForm(context).then((res) {
              if (res['statusCode'] == 200) {
                addSession(res['data']['id'], res['data']['session_token']);
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => const Menu(initialScreen: 2)
                ));
                Navigator.pop(context);
              }
            });
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
