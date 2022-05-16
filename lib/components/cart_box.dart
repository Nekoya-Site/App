import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CartBox extends StatefulWidget {
  const CartBox({
    Key? key,
    required this.controller,
    required this.imageUrl,
    required this.title,
    required this.quantity,
    required this.plus,
    required this.minus,
    required this.remove
  }) : super(key: key);

  final bool controller;
  final String imageUrl;
  final String title;
  final int quantity;
  final Function() plus;
  final Function() minus;
  final Function() remove;

  @override
  State<CartBox> createState() => _CartBoxState();
}

class _CartBoxState extends State<CartBox> {

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color(0xff212226),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
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
                children: [
                  Container(
                    margin: const EdgeInsets.only(left:10.0, right: 10.0),
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
                  widget.controller == true ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            widget.minus();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff8B0000)),
                          ),
                          child: const Text("-")
                        ),
                        Text(widget.quantity.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)
                        ),
                        ElevatedButton(
                          onPressed: (){
                            widget.plus();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff8B0000)),
                          ),
                          child: const Text("+")
                        )
                      ],
                    )
                  : Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Quantity : ${widget.quantity.toString()}",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}