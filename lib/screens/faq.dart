import 'package:flutter/material.dart';

import 'package:nekoya_app/components/faq_body.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1b1c1e),
        appBar: AppBar(
          title: const Text('FAQ'),
          centerTitle: true,
          backgroundColor: const Color(0xff212226),
        ),
        body: const FAQBody());
  }
}
