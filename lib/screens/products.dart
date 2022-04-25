import 'package:flutter/material.dart';
import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/components/product_box.dart';
import 'package:nekoya_flutter/components/product_detail.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: const Text('Nekoya'),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
      ),
      body: FutureBuilder<dynamic>(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(data!.length, (index) {
                return ProductBox(
                    imageUrl:
                        'https://nekoya.moe.team/img/' + data[index]['IMAGE'],
                    title: data[index]['TITLE'],
                    callback: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => productDetail(context, data[index]['ID']),
                      );
                    },
                );
              }),
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xff8B0000),
            ),
          );
        },
      ),
    );
  }
}