import 'package:flutter/material.dart';

import 'package:nekoya_app/components/forgot_pass_body.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
      ),
      body: const ForgotPassBody(),
    );
  }
}
