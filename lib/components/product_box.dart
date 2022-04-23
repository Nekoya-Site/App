import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductBox extends StatefulWidget {
  const ProductBox({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  final String imageUrl;
  final String title;

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff212226),
      child: InkWell(
        onTap: () {},
        splashColor: Color(0xff8B0000),
        highlightColor: Color(0xff8B0000),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: widget.imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Color(0xff8B0000),
              ),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/image-error.webp'),
              fadeOutDuration: const Duration(milliseconds: 5),
              imageBuilder: (context, imageProvider) => Container(
                width: 300,
                height: 210,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
