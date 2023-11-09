import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductBox extends StatefulWidget {
  const ProductBox(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.discount,
      required this.fontSize,
      required this.callback})
      : super(key: key);

  final String imageUrl;
  final String title;
  final int discount;
  final double fontSize;
  final Function() callback;

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color(0xff212226),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () => widget.callback(),
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 4,
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                        color: Color(0xff8B0000),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/images/image_error.webp'),
                      fadeOutDuration: const Duration(milliseconds: 5),
                      imageBuilder: (context, imageProvider) => Container(
                        width: 300,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: widget.fontSize,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              widget.discount != 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  width: 50,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0))),
                                  margin: const EdgeInsets.only(top: 10.0),
                                  child: Center(
                                      child: Text("${widget.discount}%",
                                          style: const TextStyle(
                                              color: Colors.white)))),
                            ],
                          )
                        ])
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
