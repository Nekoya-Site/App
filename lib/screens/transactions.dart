import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/components/transaction_box.dart';
import 'package:nekoya_flutter/data/auth.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  Future<dynamic> loadTransaction() async {
    try {
      var session = await getSession();
      var data = await getTransactions(session);
      return data;
    } catch(e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: const Text('Transactions'),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
      ),
      body: FutureBuilder<dynamic>(
        future: loadTransaction(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return TransactionBox(
                  orderId: data[index]['id'],
                  status: data[index]['status'],
                  firstName: data[index]['firstName'],
                  lastName: data[index]['lastName'],
                  phoneNumber: data[index]['phoneNumber'],
                  streetAddress1: data[index]['streetAddress1'],
                  district: data[index]['district'],
                  subDistrict: data[index]['subDistrict'],
                  province: data[index]['province'],
                  region: data[index]['region'],
                  postalCode: data[index]['postalCode'],
                  logistic: data[index]['logistic'],
                  data: data[index]['data'],
                );
              }
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