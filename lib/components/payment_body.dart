import 'package:flutter/material.dart';

class PaymentBody extends StatefulWidget {
  const PaymentBody({Key? key}) : super(key: key);

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 150.0),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/bca.webp',
                cacheHeight: 40,
                cacheWidth: 100,
              ),
              Image.asset(
                'assets/bni.webp',
                cacheHeight: 40,
                cacheWidth: 100,
              ),
              Image.asset(
                'assets/bri.webp',
                cacheHeight: 40,
                cacheWidth: 100,
              ),
            ],
          ),
          Row(),
        ],
      ),
    );
  }
}
