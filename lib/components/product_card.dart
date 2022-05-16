import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/utils/utils.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.press,
    required this.bgColor,
  }) : super(key: key);
  final String imageUrl, title;
  final VoidCallback press;
  final int price;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Color(0xff212226),
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff212226),
                borderRadius: BorderRadius.all(
                    Radius.circular(defaultBorderRadius)),
              ),
              // child: Image.asset(
              //   image,
              //   height: 132,
              // ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) =>
                    const Center(
                      child: CircularProgressIndicator(
                  color: Color(0xff8B0000),
                ),
                    ),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/image-error.webp'),
                fadeOutDuration: const Duration(milliseconds: 5),
                imageBuilder: (context, imageProvider) => Container(
                  height: 132,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: defaultPadding / 4),
                Text(
                  "\$$price",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
