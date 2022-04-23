import 'package:flutter/material.dart';
import 'package:nekoya_flutter/api/products.dart';
import 'package:nekoya_flutter/components/product_box.dart';

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
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return ProductBox(
                    imageUrl:
                        'https://nekoya.moe.team/img/' + data[index]['IMAGE'],
                    title: data[index]['TITLE']);
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
    );
  }
}
