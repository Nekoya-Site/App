import 'package:flutter/material.dart';

class Bannerimage extends StatelessWidget {
  const Bannerimage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: new Image.asset(
          'assets/Carousel_1.webp',
          width: 100.0,
          height: 200.0,
        ));
  }
}
