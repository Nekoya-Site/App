import 'package:flutter/material.dart';

import 'package:nekoya_app/components/payment_body.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1b1c1e),
        appBar: AppBar(
          title: const Text('Payment'),
          centerTitle: true,
          backgroundColor: const Color(0xff212226),
          automaticallyImplyLeading: false,
        ),
        body: const PaymentBody());
  }
}
