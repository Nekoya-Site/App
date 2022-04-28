import 'package:flutter/material.dart';
import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/data/cart.dart';
import 'package:nekoya_flutter/components/cart_box.dart';

class CheckoutItems extends StatefulWidget {
  CheckoutItems({Key? key}) : super(key: key);

  @override
  State<CheckoutItems> createState() => _CheckoutItemsState();
}

class _CheckoutItemsState extends State<CheckoutItems> {
  Future<dynamic> _viewCart = viewCart();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Card(
        color: const Color(0xff212226),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Items in Cart",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            FutureBuilder<dynamic>(
              future: _viewCart,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder<dynamic>(
                        future: getProduct(data[index]["product_id"]),
                        builder: (context, snapshotx) {
                          if (snapshotx.hasData) {
                            var productData = snapshotx.data;
                            if (productData != null) {
                              return CartBox(
                                  controller: false,
                                  imageUrl: 'https://nekoya.moe.team/img/' +
                                      productData[0]['IMAGE'],
                                  title: productData[0]['TITLE'],
                                  quantity: data[index]["quantity"],
                                  plus: () {},
                                  minus: () {},
                                  remove: () {});
                            }
                          }

                          return CartBox(
                            controller: false,
                            imageUrl:
                                'https://i.ibb.co/QJFLZC4/La-Darknesss-Portrait.webp',
                            title: 'Loading...',
                            quantity: 0,
                            plus: () {},
                            minus: () {},
                            remove: () {},
                          );
                        },
                      );
                    },
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff8B0000),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
