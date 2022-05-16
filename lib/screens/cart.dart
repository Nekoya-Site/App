import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/components/cart_box.dart';
import 'package:nekoya_flutter/components/cart_button.dart';
import 'package:nekoya_flutter/components/menu.dart';
import 'package:nekoya_flutter/data/cart.dart';
import 'package:nekoya_flutter/screens/checkout.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future<dynamic> _viewCart = viewCart();

  @override
  Widget build(BuildContext context) {

    Future<dynamic> getTotal() async {
      dynamic totalPrice = 0;
      var orderData = await viewCart();
      await orderData.forEach((x) async {
        var product = await getProduct(x['product_id']);
        totalPrice += product[0]['PRICE'] * x['quantity'];
      });

      return Future.delayed(const Duration(seconds: 2), () {
        return totalPrice;
      });
    }

    Future<dynamic> getTotal_ = getTotal();

    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 80.0),
        child: FutureBuilder<dynamic>(
          future: _viewCart,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              if (data.isNotEmpty) {
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
                              imageUrl: "https://nekoya.moe.team/img/${productData[0]['IMAGE']}",
                              title: productData[0]['TITLE'],
                              quantity: data[index]["quantity"],
                              plus: () {
                                addToCart(data[index]["product_id"]);
                                setState(() {
                                  _viewCart = viewCart();
                                  getTotal_ = getTotal();
                                });
                              },
                              minus: () {
                                removeFromCart(data[index]["product_id"], false);
                                setState(() {
                                  _viewCart = viewCart();
                                  getTotal_ = getTotal();
                                });
                              },
                              remove: () {
                                removeFromCart(data[index]["product_id"], true);
                                setState(() {
                                  _viewCart = viewCart();
                                  getTotal_ = getTotal();
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
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 200.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/cart_empty.webp')
                      )
                    ),
                  ),
                );
              }
            }

            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff8B0000),
              ),
            );
          }
        ),
      ),
      floatingActionButton: FutureBuilder<dynamic>(
        future: getTotal_,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var price = snapshot.data;
            if (price != 0) {
              return CartButton(
                icon: const Icon(Icons.shopping_cart_checkout),
                text1: "Rp ${NumberFormat('#,##0.00', 'ID').format(price)}",
                text2: "Checkout",
                refer: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Checkout())
                  );
                },
              );
            }

            return CartButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              text1: "Cart is Empty",
              text2: "Shop Now",
              refer: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Menu(initialScreen: 2))
                );
              },
            );
          }

          return const SizedBox(width: 1.0,);
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}