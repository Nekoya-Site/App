import 'package:flutter/material.dart';

class Bannerimage extends StatelessWidget {
  const Bannerimage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: [
            Container(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  'assets/images/slider_1.webp',
                  width: 600.0,
                  height: 180.0,
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SPRING / SUMMER COLLECTION 2022',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.5,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      'Get up to 30% off \nNow Arrivals',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/products');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      child: const Text('SHOP NOW'),
                    ),
                  ]),
            )
          ],
        ));
  }
}
