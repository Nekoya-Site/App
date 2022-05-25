import 'package:flutter/material.dart';
import 'package:nekoya_flutter/components/about_us_body.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1b1c1e),
        appBar: AppBar(
          title: const Text('About Us'),
          centerTitle: true,
          backgroundColor: const Color(0xff212226),
        ),
        body: const AboutUsBody());
  }
}
