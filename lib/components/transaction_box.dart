import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/components/transaction_product_box.dart';

class TransactionBox extends StatefulWidget {
  const TransactionBox({
    Key? key, 
    required this.orderId,
    required this.status,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.streetAddress1,
    required this.district,
    required this.subDistrict,
    required this.province,
    required this.region,
    required this.postalCode,
    required this.logistic,
    required this.data
  }) : super(key: key);

  final int orderId;
  final String status;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String streetAddress1;
  final String district;
  final String subDistrict;
  final String province;
  final String region;
  final String postalCode;
  final String logistic;
  final String data;

  @override
  State<TransactionBox> createState() => _TransactionBoxState();
}

class _TransactionBoxState extends State<TransactionBox> {
  @override
  Widget build(BuildContext context) {
    var orderData = jsonDecode(widget.data);

    return ExpansionTile(
      backgroundColor: const Color(0xff212226),
      // trailing: const Text('-', style: TextStyle(color: Colors.white),),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('#' + widget.orderId.toString(), style: const TextStyle(color: Colors.white),),
          Text(widget.status, style: const TextStyle(color: Colors.white),)
        ],
      ),
      children: [
        Container(
          margin: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Sender Details', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),),
                    const SizedBox(height: 5,),
                    Text("${widget.firstName} ${widget.lastName}", style: const TextStyle(color: Colors.white),),
                    Text(widget.phoneNumber, style: const TextStyle(color: Colors.white),),
                    Text("${widget.streetAddress1}, ${widget.district}, ${widget.subDistrict}, ${widget.province}, ${widget.region}, ${widget.postalCode}", style: const TextStyle(color: Colors.white),),
                  ]
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Logistic', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),),
                      const SizedBox(height: 5,),
                      Text(widget.logistic, style: const TextStyle(color: Colors.white),),
                      // const SizedBox(height: 55,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.all(15.0),
          child: Card(
            color: const Color(0xff1b1c1e),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: orderData.length,
              itemBuilder: (context, index) {
                return FutureBuilder<dynamic>(
                  future: getProduct(orderData[index]['product_id']),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var productData = snapshot.data;
                      return TransactionProductBox(
                        imageUrl: 'https://nekoya.moe.team/img/' + productData[0]['IMAGE'],
                        title: productData[0]['TITLE'],
                        quantity: orderData[index]["quantity"],
                      );
                    }

                    return const TransactionProductBox(
                      imageUrl: 'https://i.ibb.co/QJFLZC4/La-Darknesss-Portrait.webp',
                      title: 'Loading...',
                      quantity: 0,
                    );
                  }
                );
              }
            ),
          ),
        )
      ],
    );
  }
}