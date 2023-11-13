import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

final List<String> imgList = [
  'https://nekoya.moe.team/img/Carousel_1.webp',
  'https://nekoya.moe.team/img/Carousel_2.webp',
  'https://nekoya.moe.team/img/Carousel_3.webp',
];

class _CarouselState extends State<Carousel> {
  final CarouselController _controller = CarouselController();
  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: item,
                    placeholder: (context, url) => Container(
                      width: 1000,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/logo_transparent.webp'),
                              fit: BoxFit.contain)),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/image_error.webp'),
                    fadeOutDuration: const Duration(milliseconds: 5),
                    imageBuilder: (context, imageProvider) => Container(
                      width: 1000,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: const SizedBox(
                          width: 1.0,
                        )),
                  ),
                ],
              )),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 2,
            autoPlay: true));
  }
}
