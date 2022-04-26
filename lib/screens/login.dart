import 'package:flutter/material.dart';
import 'package:nekoya_flutter/components/login_form.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1b1c1e),
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          backgroundColor: const Color(0xff212226),
        ),
        body: const LoginForm());
  }
}
