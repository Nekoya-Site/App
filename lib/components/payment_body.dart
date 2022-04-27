import 'package:flutter/material.dart';

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
              ExpansionTile(
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
              ExpansionTile(
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
              ExpansionTile(
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
            ])
        // children: [
        //   Container(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         Image.asset(
        //           'assets/bca.webp',
        //           cacheHeight: 40,
        //           cacheWidth: 100,
        //         ),
        //         Image.asset(
        //           'assets/bni.webp',
        //           cacheHeight: 40,
        //           cacheWidth: 100,
        //         ),
        //         Image.asset(
        //           'assets/bri.webp',
        //           cacheHeight: 40,
        //           cacheWidth: 100,
        //         ),
        //       ],
        //     ),
        //   ),
        // ExpansionTile(
        //   title: Text('data'),
        //   children: [
        //     ListView(
        //       scrollDirection: Axis.vertical,
        //       shrinkWrap: true,
        //       children: [
        //         Container(
        //           child: Text('data'),
        //         )
        //       ],
        //     )
        //   ],
        // ),
        // ListView(
        //   scrollDirection: Axis.vertical,
        //   shrinkWrap: true,
        //   children: [
        //     ExpansionTile(
        //       title: Text('data'),
        //       children: [
        //         ListTile(
        //           title: const Text('data'),
        //         )
        //       ],
        //     ),
        //   ],
        // )
        // GFAccordion(
        //   titleBorderRadius: BorderRadius.circular(20),
        //   contentBorderRadius: BorderRadius.circular(20),
        //   expandedTitleBackgroundColor: Colors.blue.shade800,
        //   contentBackgroundColor: Colors.blue.shade800,
        //   collapsedTitleBackgroundColor: Colors.blue.shade400,
        //   title: 'BCA',
        //   content:
        //       '1. Login pada alamat Internet Banking BCA (***) \n2. Pilih menu Pembayaran Tagihan > Pembayaran \n3. Pada Ke Rekening masukkan Rekening perusahaan \n4. Masukkan Jumlah Nominal yang akan ditransfer \n5. Kemudian tekan send. Cetak/simpan stuck Transfer sebagai bukti pembayaran',
        // ),
        // GFAccordion(
        //   titleBorderRadius: BorderRadius.circular(20),
        //   expandedTitleBackgroundColor: Colors.blue.shade800,
        //   contentBackgroundColor: Colors.blue.shade800,
        //   collapsedTitleBackgroundColor: Colors.blue.shade400,
        //   title: 'BCA',
        //   content:
        //       '1. Login pada alamat Internet Banking BCA (***) \n2. Pilih menu Pembayaran Tagihan > Pembayaran \n3. Pada Ke Rekening masukkan Rekening perusahaan \n4. Masukkan Jumlah Nominal yang akan ditransfer \n5. Kemudian tekan send. Cetak/simpan stuck Transfer sebagai bukti pembayaran',
        // ),
        // GFAccordion(
        //   titleBorderRadius: BorderRadius.circular(20),
        //   expandedTitleBackgroundColor: Colors.blue.shade800,
        //   contentBackgroundColor: Colors.blue.shade800,
        //   collapsedTitleBackgroundColor: Colors.blue.shade400,
        //   title: 'BCA',
        //   content:
        //       '1. Login pada alamat Internet Banking BCA (***) \n2. Pilih menu Pembayaran Tagihan > Pembayaran \n3. Pada Ke Rekening masukkan Rekening perusahaan \n4. Masukkan Jumlah Nominal yang akan ditransfer \n5. Kemudian tekan send. Cetak/simpan stuck Transfer sebagai bukti pembayaran',
        // )
        //   Container(
        //   margin: const EdgeInsets.all(15.0),
        //   child: Card(
        //     color: const Color(0xff1b1c1e),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: ListView.builder(
        //       scrollDirection: Axis.vertical,
        //       shrinkWrap: true,
        //       itemBuilder: (context, index) {
        //         return Container(
        //           child: Text('data'),
        //         )
        //       }
        //     ),
        //   ),
        // )

        );
  }
}
