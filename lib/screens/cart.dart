import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/components/cart_box.dart';
import 'package:nekoya_flutter/data/cart.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future<dynamic> _viewCart = viewCart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
      ),
      body: FutureBuilder<dynamic>(
        future: _viewCart,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return FutureBuilder<dynamic>(
                  future: getProduct(data[index]["product_id"]),
                  builder: (context, snapshotx) {
                    if (snapshotx.hasData) {
                      var productData = snapshotx.data;
                      if (productData != null) {
                        return CartBox(
                          controller: true,
                          imageUrl: 'https://nekoya.moe.team/img/' + productData[0]['IMAGE'],
                          title: productData[0]['TITLE'],
                          quantity: data[index]["quantity"],
                          plus: () {
                            addToCart(data[index]["product_id"]);
                            setState(() {
                              _viewCart = viewCart();
                            });
                          },
                          minus: () {
                            removeFromCart(data[index]["product_id"], false);
                            setState(() {
                              _viewCart = viewCart();
                            });
                          },
                          remove: () {
                            removeFromCart(data[index]["product_id"], true);
                            setState(() {
                              _viewCart = viewCart();
                            });
                          }
                        );
                      }
                    }

                    return CartBox(
                      controller: true,
                      imageUrl: 'https://i.ibb.co/QJFLZC4/La-Darknesss-Portrait.webp',
                      title: 'Loading...',
                      quantity: 0,
                      plus: () {},
                      minus: () {},
                      remove: () {},
                    );
                  }
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xff8B0000),
            ),
          );
        }
      )
    );
  }
}