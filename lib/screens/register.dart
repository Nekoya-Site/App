import 'package:flutter/material.dart';
import 'package:nekoya_flutter/components/register_form.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1b1c1e),
        appBar: AppBar(
          title: const Text('Register'),
          centerTitle: true,
          backgroundColor: const Color(0xff212226),
        ),
        body: const RegisterForm());
  }
}
