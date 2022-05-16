import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/utils/utils.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.press,
    required this.bgColor,
  }) : super(key: key);
  final String imageUrl, title;
  final VoidCallback press;
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
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) =>
                    const Center(
                      child: CircularProgressIndicator(
                  color: Color(0xff8B0000),
                ),
                    ),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/image_error.webp'),
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
