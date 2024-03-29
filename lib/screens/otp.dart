import 'package:flutter/material.dart';

import 'package:nekoya_app/components/otp_body.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key, required this.otpToken}) : super(key: key);

  final String otpToken;

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: const Text('OTP'),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
      ),
      body: OtpBody(
        otpToken: widget.otpToken,
      ),
    );
  }
}
