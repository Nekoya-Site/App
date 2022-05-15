import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> imgList = [
    Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/Carousel_1.webp'))))
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildimage(String ImageList, int index) => ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          margin: EdgeInsets.all(5),
          color: Colors.amber,
          child: Image.asset(ImageList, fit: BoxFit.cover)));
}
