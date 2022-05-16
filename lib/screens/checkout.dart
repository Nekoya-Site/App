import 'package:flutter/material.dart';

import 'package:nekoya_flutter/components/checkout_form.dart';
import 'package:nekoya_flutter/components/checkout_items.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CheckoutItems(),
              CheckoutForm(),
            ],
          ),
        ),
      ),
    );
  }
}
