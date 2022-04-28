import 'package:flutter/material.dart';
import 'package:nekoya_flutter/screens/transactions.dart';

class PaymentBody extends StatefulWidget {
  const PaymentBody({Key? key}) : super(key: key);

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  @override
  Widget build(BuildContext context) {
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
                  'assets/bca.webp',
                  cacheHeight: 40,
                  cacheWidth: 100,
                ),
                Image.asset(
                  'assets/bni.webp',
                  cacheHeight: 40,
                  cacheWidth: 100,
                ),
                Image.asset(
                  'assets/bri.webp',
                  cacheHeight: 40,
                  cacheWidth: 100,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: ExpansionTile(
                backgroundColor: Colors.blue,
                collapsedBackgroundColor: Colors.blue.shade800,
                textColor: Colors.white,
                collapsedTextColor: Colors.white,
                title: const Text('BCA'),
                children: const [
                  ListTile(
                    textColor: Colors.white,
                    title: Text(
                        '1. Login pada alamat Internet Banking BCA (***) \n2. Pilih menu Pembayaran Tagihan > Pembayaran \n3. Pada Ke Rekening masukkan Rekening perusahaan \n4. Masukkan Jumlah Nominal yang akan ditransfer \n5. Kemudian tekan send. Cetak/simpan stuck Transfer sebagai bukti pembayaran'),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: ExpansionTile(
                backgroundColor: Colors.blue,
                collapsedBackgroundColor: Colors.blue.shade800,
                textColor: Colors.white,
                collapsedTextColor: Colors.white,
                title: const Text('BNI'),
                children: const [
                  ListTile(
                    textColor: Colors.white,
                    title: Text(
                        '1. Login pada alamat Internet Banking BNI (***)\n2. Pilih menu Pembayaran Tagihan > Pembayaran > Antar Rekening\n3. Pada Ke Rekening masukkan Rekening perusahaan\n4. Masukkan Jumlah Nominal yang akan ditransfer\n5. Kemudian tekan send. Cetak/simpan stuck Transfer sebagai bukti pembayaran'),
                  )
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: ExpansionTile(
              backgroundColor: Colors.blue,
              collapsedBackgroundColor: Colors.blue.shade800,
              textColor: Colors.white,
              collapsedTextColor: Colors.white,
              title: const Text('BRI'),
              children: const [
                ListTile(
                  textColor: Colors.white,
                  title: Text(
                      '1. Login pada alamat Internet Banking BRI (***)\n2. Pilih menu Pembayaran Tagihan > Pembayaran > Antar Rekening\n3. Pada Ke Rekening masukkan Rekening perusahaan\n4. Masukkan Jumlah Nominal yang akan ditransfer\n5. Kemudian tekan send. Cetak/simpan stuck Transfer sebagai bukti pembayaran'),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 40),
            color: Colors.transparent,
          ),
          Container(
            child: const Text(
              '13000000',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.red.shade800,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 40),
            color: Colors.transparent,
          ),
          ElevatedButton(
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(Colors.red.shade800),
                backgroundColor:
                    MaterialStateProperty.all(Colors.red.shade800),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.red)))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Transactions()));
            },
            child: const Text(
              'Transaction',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
