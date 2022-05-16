import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TransactionProductBox extends StatefulWidget {
  const TransactionProductBox({Key? key, required this.imageUrl, required this.title, required this.quantity}) : super(key: key);

  final String imageUrl;
  final String title;
  final int quantity;

  @override
  State<TransactionProductBox> createState() => _TransactionProductBoxState();
}

class _TransactionProductBoxState extends State<TransactionProductBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
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
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text("Quantity : ${widget.quantity.toString()}",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w400
                  )
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}