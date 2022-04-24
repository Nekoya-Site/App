import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: const Text('Nekoya'),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
      ),
      body: Text('Checkout'),
    );
  }
}
