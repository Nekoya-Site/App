import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/data/cart.dart';
import 'package:nekoya_flutter/components/cart_box.dart';

class CheckoutItems extends StatefulWidget {
  const CheckoutItems({Key? key}) : super(key: key);

  @override
  State<CheckoutItems> createState() => _CheckoutItemsState();
}

class _CheckoutItemsState extends State<CheckoutItems> {

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
              future: viewCart(),
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
                                  imageUrl: "https://nekoya.moe.team/img/${productData[0]['IMAGE']}",
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
            Container(
              margin:
                  const EdgeInsets.only(top: 15.0, right: 15.0, bottom: 20.0),
              child: FutureBuilder<dynamic>(
                future: getTotal(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var price = snapshot.data;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Total : Rp ${NumberFormat('#,##0.00', 'ID').format(price)}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    );
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Total : -",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
