import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/data/cart.dart';
import 'package:nekoya_flutter/components/menu.dart';

class PaymentBody extends StatefulWidget {
  const PaymentBody({Key? key}) : super(key: key);

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
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
      decoration: const BoxDecoration(color: Colors.transparent),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/bca.webp',
                  cacheHeight: 40,
                  cacheWidth: 100,
                ),
                Image.asset(
                  'assets/images/bni.webp',
                  cacheHeight: 40,
                  cacheWidth: 100,
                ),
                Image.asset(
                  'assets/images/bri.webp',
                  cacheHeight: 40,
                  cacheWidth: 100,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: const ExpansionTile(
                  backgroundColor: Color(0xff212226),
                  collapsedBackgroundColor: Color(0xff212226),
                  textColor: Colors.white,
                  collapsedTextColor: Colors.white,
                  title: Text(
                    'BCA',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  children: [
                    ListTile(
                      textColor: Colors.white,
                      title: Text(
                          '1. Login pada alamat Internet Banking BCA (***) \n2. Pilih menu Pembayaran Tagihan > Pembayaran \n3. Pada Ke Rekening masukkan Rekening perusahaan \n4. Masukkan Jumlah Nominal yang akan ditransfer \n5. Kemudian tekan send. Cetak/simpan stuck Transfer sebagai bukti pembayaran'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: const ExpansionTile(
                  backgroundColor: Color(0xff212226),
                  collapsedBackgroundColor: Color(0xff212226),
                  textColor: Colors.white,
                  collapsedTextColor: Colors.white,
                  title: Text(
                    'BNI',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  children: [
                    ListTile(
                      textColor: Colors.white,
                      title: Text(
                          '1. Login pada alamat Internet Banking BNI (***)\n2. Pilih menu Pembayaran Tagihan > Pembayaran > Antar Rekening\n3. Pada Ke Rekening masukkan Rekening perusahaan\n4. Masukkan Jumlah Nominal yang akan ditransfer\n5. Kemudian tekan send. Cetak/simpan stuck Transfer sebagai bukti pembayaran'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: const ExpansionTile(
                backgroundColor: Color(0xff212226),
                collapsedBackgroundColor: Color(0xff212226),
                textColor: Colors.white,
                collapsedTextColor: Colors.white,
                title: Text(
                  'BRI',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                children: [
                  ListTile(
                    textColor: Colors.white,
                    title: Text(
                        '1. Login pada alamat Internet Banking BRI (***)\n2. Pilih menu Pembayaran Tagihan > Pembayaran > Antar Rekening\n3. Pada Ke Rekening masukkan Rekening perusahaan\n4. Masukkan Jumlah Nominal yang akan ditransfer\n5. Kemudian tekan send. Cetak/simpan stuck Transfer sebagai bukti pembayaran'),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 40),
            color: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange.shade800),
                borderRadius: BorderRadius.circular(18),
                //color: const Color.fromARGB(255, 38, 173, 54),
              ),
              child: FutureBuilder<dynamic>(
                future: getTotal(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var price = snapshot.data;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rp ${NumberFormat('#,##0.00', 'ID').format(price)}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    );
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Count total price on process!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 40),
            color: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(const Color(0xff8B0000)),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff8B0000)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Color(0xff8B0000))))),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '');
              },
              child: const Text(
                'Transaction',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
