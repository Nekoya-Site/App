import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:nekoya_app/api/api.dart';
import 'package:nekoya_app/data/auth.dart';
import 'package:nekoya_app/data/cart.dart';

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({Key? key}) : super(key: key);

  @override
  State<CheckoutForm> createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  Future<dynamic> loadCheckout(checkoutData) async {
    var session = await getSession();
    var data = await checkoutPost(session, checkoutData);
    return data;
  }

  Future submitForm(BuildContext context) async {
    var currentCart = await viewCart();
    var cartData = jsonEncode(currentCart).toString();

    Map<String, dynamic> data = {
      "firstName": 'Moe',
      "lastName": 'Poi',
      "phoneNumber": '081234567890',
      "streetAddress1": 'isekai',
      "streetAddress2": '-',
      "region": '-',
      "province": '-',
      "city": '-',
      "district": '-',
      "subDistrict": '-',
      "postalCode": '12345',
      "logistic": 'JNE',
      "data": cartData,
    };

    await clearCart();

    var statusCode = await loadCheckout(data);
    return statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Card(
        color: const Color(0xff212226),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(5, 20, 5, 20),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      child: MaterialButton(
                        padding: const EdgeInsets.all(15.0),
                        minWidth: double.infinity,
                        height: 35,
                        onPressed: () {
                          checkSessionExist().then((isLoggedIn) {
                            if (isLoggedIn) {
                              submitForm(context).then((statusCode) {
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(
                                    context, '/transactions');
                              });
                            } else {
                              Navigator.pushNamed(context, '/login');
                            }
                          });
                        },
                        color: const Color(0xff8B0000),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: const Text(
                          "Pay",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
