import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';

Widget makeDismissible({required context, required Widget child}) => GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: () => Navigator.of(context).pop(),
  child: GestureDetector(
    onTap: () {},
    child: child,
  )
);

Widget productDetail(context, id) {
  return makeDismissible(
    context: context,
    child: DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 1,
      builder: (_, controller) => FutureBuilder<dynamic> (
        future: getProduct(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xff1b1c1e),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
              ),
              padding: const EdgeInsets.all(16),
              child: ListView(
                controller: controller,
                children: [
                  CachedNetworkImage(
                    imageUrl: 'https://nekoya.moe.team/img/' + data[0]['IMAGE'],
                    placeholder: (context, url) =>
                      const CircularProgressIndicator(
                        color: Color(0xff8B0000),
                    ),
                    errorWidget: (context, url, error) => Image.asset('assets/image-error.webp'),
                    fadeOutDuration: const Duration(milliseconds: 5),
                    imageBuilder: (context, imageProvider) => Container(
                      margin: const EdgeInsets.all(5.0),
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                  ),
                  Text(data[0]['TITLE'], style: const TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 15.0),
                  Text(data[0]['DESCRIPTION'], style: const TextStyle(color: Colors.white, fontSize: 18.0),),
                  const SizedBox(height: 15.0),
                  Text('Price : ' + data[0]['PRICE'].toString(), style: const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),),
                  Text('Stock : ' + data[0]['STOCK'].toString(), style: const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),),
                  Text('Size : ' + data[0]['SIZE'], style: const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),),
                  const SizedBox(height: 30.0),
                  ElevatedButton.icon(
                    onPressed: (){},
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Add to Cart', style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff8B0000)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                        )
                      )
                    )
                  )
                ],
              )
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xff8B0000),
            ),
          );
        }
      )
    )
  );
}